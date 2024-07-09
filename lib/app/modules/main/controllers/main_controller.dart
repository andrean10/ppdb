import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:ppdb/app/data/menu_model/menu_model.dart';
import 'package:ppdb/app/helpers/receipt.dart';
import 'package:ppdb/app/modules/init/controllers/init_controller.dart';

import '../../../../utils/constants_values_firebase.dart';
import '../../../data/form_model/form_siswa_model.dart';
import '../../../data/profile_model/profile_model.dart';
import '../../../data/user_model/users_model.dart';
import '../../../helpers/excel.dart';
import '../../../routes/app_pages.dart';

enum ROLE { admin, user }

class MainController extends GetxController {
  late final InitController _initC;

  final dir = Directory('/storage/emulated/0/documents');
  final listMenu = <MenuModel>[].obs;

  final isApproved = false.obs;
  final isConfirmed = false.obs;
  var isUser = false;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    final args = Get.arguments as String?;

    if (args == ROLE.admin.name) {
      listMenu.addAll(
        [
          MenuModel(
            icon: Symbols.demography_rounded,
            title: 'Daftar Calon Siswa',
            onPressed: _moveToListCandidates,
          ),
          MenuModel(
            icon: Symbols.patient_list_rounded,
            title: 'Rekapitulasi Data PD',
            onPressed: _moveToDataRecapPD,
          ),
          MenuModel(
            icon: Symbols.download_rounded,
            title: 'Unduh Data',
            onPressed: () => ExportExcel.export(_initC.firestore),
          ),
        ],
      );
      isUser = false;
    }

    if (args == ROLE.user.name) {
      listMenu.addAll(
        [
          MenuModel(
            icon: Symbols.campaign_rounded,
            title: 'Informasi',
            onPressed: _moveToInformation,
          ),
          MenuModel(
            icon: Symbols.task_rounded,
            title: 'Data Calon Siswa',
            onPressed: _moveToStudentData,
          ),
          MenuModel(
            icon: Symbols.upload_file_rounded,
            title: 'Unggah Berkas',
            onPressed: _moveToUploadFile,
          ),
          MenuModel(
            icon: Symbols.info_rounded,
            title: 'Tentang Sekolah',
            onPressed: _moveToAboutSchool,
          ),
          MenuModel(
            icon: Symbols.forum_rounded,
            title: 'Sosmed',
            onPressed: _moveToSosmed,
          ),
        ],
      );
      isUser = true;

      // cek user
      _fetchUser();
    }
  }

  void _moveToInformation() => Get.toNamed(Routes.INFORMATION);

  void _moveToStudentData() => Get.toNamed(Routes.PROSPECTIVE_STUDENT_DATA);

  void _moveToUploadFile() => Get.toNamed(Routes.UPLOAD_FILE);

  void _moveToAboutSchool() => Get.toNamed(Routes.ABOUT);

  void _moveToSosmed() => Get.toNamed(Routes.SOCIAL_MEDIA);

  void _moveToListCandidates() => Get.toNamed(Routes.LIST_CANDIDATES);

  void _moveToDataRecapPD() => Get.toNamed(Routes.RECAPITULATION);

  void _fetchUser() {
    final uid = _initC.auth.currentUser?.uid;

    _initC.firestore
        .collection(ConstantsValuesFirebase.colUser)
        .withConverter(
          fromFirestore: (snapshot, _) => UsersModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        )
        .doc(uid)
        .snapshots()
        .asyncExpand(
      (eventUser) {
        if (eventUser.exists && eventUser.data() != null) {
          final data = eventUser.data()!;

          isApproved.value = data.isApproved!;
          isConfirmed.value = data.isConfirmed!;

          return _initC.firestore
              .collection(ConstantsValuesFirebase.colStudentForm)
              .withConverter(
                fromFirestore: (snapshot, _) =>
                    FormSiswaModel.fromJson(snapshot.data()!),
                toFirestore: (value, _) => value.toJson(),
              )
              .where(
                FieldPath.fromString('createdBy'),
                isEqualTo: uid,
              )
              .get()
              .asStream()
              .asyncExpand(
            (eventForm) {
              final formSiswa = eventForm.docs.first.data();
              return Stream.value(
                ProfileModel(
                  user: data,
                  formSiswa: formSiswa,
                ),
              );
            },
          );
        }
      },
    ).listen(
      (event) {
        final itemPrintReceipt = MenuModel(
          icon: Icons.print_rounded,
          title: 'Cetak Resi',
          onPressed: () => Receipt.print(event),
        );

        if (event.user.isApproved! && event.user.isConfirmed!) {
          listMenu.add(itemPrintReceipt);
        } else {
          listMenu.removeWhere(
            (element) => element.title == itemPrintReceipt.title,
          );
        }
      },
    );
  }

  // void _showSnackbar({
  //   required String content,
  //   String? path,
  //   material.TextStyle? textStyle,
  //   required material.Color backgroundColor,
  //   Duration? duration,
  // }) {
  //   material.ScaffoldMessenger.of(Get.context!).showSnackBar(
  //     material.SnackBar(
  //       content: material.Text(
  //         content,
  //         style: textStyle ??
  //             Get.textTheme.labelLarge?.copyWith(
  //               color: material.Colors.white,
  //             ),
  //       ),
  //       backgroundColor: backgroundColor,
  //       duration: duration ?? 3.minutes,
  //       action: (path != null)
  //           ? material.SnackBarAction(
  //               label: 'Lihat File',
  //               onPressed: () async {
  //                 try {
  //                   await OpenFilex.open(path);

  //                   // await Permission.manageExternalStorage.onDeniedCallback(() {
  //                   //   // Your code
  //                   // }).onGrantedCallback(() async {
  //                   //   await OpenFilex.open(path);
  //                   // }).onPermanentlyDeniedCallback(() {
  //                   //   // Your code
  //                   // }).onRestrictedCallback(() {
  //                   //   // Your code
  //                   // }).onLimitedCallback(() {
  //                   //   // Your code
  //                   // }).onProvisionalCallback(() {
  //                   //   // Your code
  //                   // }).request();
  //                 } on Exception catch (e) {
  //                   _initC.logger.e(
  //                     'Error: showSnackbar',
  //                     error: e,
  //                   );
  //                 }

  //                 // final res = await OpenFilex.open(path);

  //                 // _initC.logger.d('debug: res message = ${res.message}');
  //                 // _initC.logger.d('debug: res type = ${res.type.toString()}');
  //               },
  //             )
  //           : null,
  //     ),
  //   );
  // }

  Future<void> logout() async {
    final textTheme = Get.textTheme;

    Get.defaultDialog(
      title: 'Peringatan',
      middleText: 'Apakah anda yakin ingin logout dari aplikasi',
      titleStyle: textTheme.titleLarge,
      middleTextStyle: textTheme.bodyMedium,
      textCancel: 'Tidak',
      textConfirm: 'Iya',
      onConfirm: () async {
        try {
          await _initC.clearWhenLogout();
          await Get.offAllNamed(Routes.LOGIN);
        } catch (e) {
          _initC.logger.e('Error: $e');
        }
      },
    );
  }
}
