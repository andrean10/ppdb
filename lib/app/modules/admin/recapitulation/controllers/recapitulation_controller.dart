import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/modules/init/controllers/init_controller.dart';

import '../../../../../utils/constants_values_firebase.dart';
import '../../../../data/form_model/form_siswa_model.dart';
import '../../../../data/profile_model/profile_model.dart';
import '../../../../data/user_model/users_model.dart';
import '../../../../routes/app_pages.dart';

class RecapitulationController extends GetxController {
  late final InitController _initC;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }
  }

  Stream<List<ProfileModel>> fetchUser() {
    return _initC.firestore
        .collection(ConstantsValuesFirebase.colUser)
        .withConverter(
          fromFirestore: (snapshot, _) => UsersModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        )
        .where(FieldPath.fromString('role'), isEqualTo: 'user')
        .where(FieldPath.fromString('isApproved'), isEqualTo: true)
        .where(FieldPath.fromString('isConfirmed'), isEqualTo: true)
        .snapshots()
        .asyncExpand(
      (eventUser) {
        if (eventUser.docs.isNotEmpty) {
          return _initC.firestore
              .collection(ConstantsValuesFirebase.colStudentForm)
              .withConverter(
                fromFirestore: (snapshot, _) =>
                    FormSiswaModel.fromJson(snapshot.data()!),
                toFirestore: (value, _) => value.toJson(),
              )
              .where(
                FieldPath.fromString('createdBy'),
                whereIn: eventUser.docs.map((user) => user.id).toList(),
              )
              .get()
              .asStream()
              .asyncExpand(
            (eventForm) {
              final formSiswa = eventForm.docs.map((e) => e.data()).toList();

              List<ProfileModel> profileModel = [];

              for (var i = 0; i < eventUser.docs.length; i++) {
                final user = eventUser.docs[i];

                for (var j = 0; j < formSiswa.length; j++) {
                  final form = formSiswa[j];

                  if (form.createdBy == user.id) {
                    profileModel.add(
                      ProfileModel(
                        user: user.data(),
                        formSiswa: form,
                      ),
                    );
                  }
                }
              }

              return Stream.value(profileModel);
            },
          );
        }

        return const Stream.empty();
      },
    );
  }

  void moveToDetailCandidates(ProfileModel profile) {
    Get.toNamed(
      Routes.DETAIL_CANDIDATES,
      arguments: profile,
    );
  }
}
