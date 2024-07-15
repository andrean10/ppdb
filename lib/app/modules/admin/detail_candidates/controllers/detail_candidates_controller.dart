import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/data/profile_model/profile_model.dart';
import 'package:ppdb/app/data/upload_files_model/upload_files_model.dart';
import 'package:ppdb/app/modules/init/controllers/init_controller.dart';
import 'package:ppdb/shared/shared_theme.dart';
import 'package:ppdb/utils/constants_values_firebase.dart';

import '../../../../../shared/shared_method.dart';
import '../../../../data/user_model/users_model.dart';

class DetailCandidatesController extends GetxController {
  late final InitController initC;
  late ProfileModel profile;
  final isLoadingApproved = false.obs;
  final isLoadingRejected = false.obs;
  final isChangeAction = false.obs;

  final dir = Directory('/storage/emulated/0/documents');

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      initC = Get.find<InitController>();
    }

    profile = Get.arguments as ProfileModel;
  }

  Future<ProfileModel>? fetchProfile() {
    return initC.firestore
        .collection(ConstantsValuesFirebase.colUploadFiles)
        .withConverter(
          fromFirestore: (snapshot, _) =>
              UploadFilesModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        )
        .doc(profile.formSiswa?.createdBy)
        .get()
        .then((value) => profile.copyWith(uploadFiles: value.data()));
  }

  Stream<DocumentSnapshot<UsersModel>> streamUser() {
    final uid = profile.formSiswa?.createdBy;

    return initC.firestore
        .collection(ConstantsValuesFirebase.colUser)
        .withConverter(
          fromFirestore: (snapshot, _) => UsersModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        )
        .doc(uid)
        .snapshots();
  }

  Future<void> approved() async {
    isLoadingApproved.value = true;

    try {
      final uid = profile.formSiswa?.createdBy;

      final dataSiswa = await initC.firestore
          .collection(ConstantsValuesFirebase.colUser)
          .withConverter(
            fromFirestore: (snapshot, _) =>
                UsersModel.fromJson(snapshot.data()!),
            toFirestore: (value, _) => value.toJson(),
          )
          .where(FieldPath.fromString('noRegis'), isNotEqualTo: null)
          .orderBy(
            FieldPath.fromString('noRegis'),
            descending: true,
          )
          .limit(1)
          .get();

      if (dataSiswa.docs.isNotEmpty && dataSiswa.docs.first.exists) {
        final noRegis = dataSiswa.docs.first.data().noRegis;

        if (noRegis != null) {
          await initC.firestore
              .collection(ConstantsValuesFirebase.colUser)
              .doc(uid)
              .update({
            'isApproved': true,
            'isConfirmed': true,
            'noRegis': noRegis + 1,
          });
        }

        showSnackbar(
          content: 'Siswa ini telah anda terima pendaftarannya',
          backgroundColor: Get.isDarkMode
              ? SharedTheme.darkSuccessColor
              : SharedTheme.lightSuccessColor,
          duration: 3.seconds,
        );
      }
    } on FirebaseException catch (e) {
      initC.logger.e(
        'Error: ',
        error: e,
        stackTrace: e.stackTrace,
      );
    } finally {
      isLoadingApproved.value = false;
    }
  }

  Future<void> decline() async {
    isLoadingRejected.value = true;
    isChangeAction.value = false;

    try {
      final uid = profile.formSiswa?.createdBy;

      await initC.firestore
          .collection(ConstantsValuesFirebase.colUser)
          .doc(uid)
          .update({
        'isApproved': false,
        'isConfirmed': true,
      });

      showSnackbar(
        content: 'Siswa ini telah anda tolak pendaftarannya',
        backgroundColor: Get.isDarkMode
            ? SharedTheme.darkSuccessColor
            : SharedTheme.lightSuccessColor,
        duration: 3.seconds,
      );
    } on FirebaseException catch (e) {
      initC.logger.e(
        'Error: ',
        error: e,
        stackTrace: e.stackTrace,
      );
    } finally {
      isLoadingRejected.value = false;
    }
  }
}
