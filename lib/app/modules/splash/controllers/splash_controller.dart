import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/modules/init/controllers/init_controller.dart';
import '../../../../utils/constants_values.dart';
import '../../../../utils/constants_values_firebase.dart';
import '../../../routes/app_pages.dart';
import '../../main/controllers/main_controller.dart';

class SplashController extends GetxController {
  late final InitController _initC;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    Future.delayed(5.seconds, () => _checkAuth());
  }

  Future<void> _checkAuth() async {
    final role = _initC.localStorage.read<String>(ConstantsValues.role);

    try {
      if (_initC.auth.currentUser != null) {
        if (role != null) {
          if (role == ROLE.admin.name) {
            Get.offAllNamed(
              Routes.MAIN,
              arguments: role,
            );
          } else {
            // cek jika user sudah mengisi form maka arahkan ke main view
            final dataUser = await _initC.firestore
                .collection(ConstantsValuesFirebase.colStudentForm)
                .where(
                  FieldPath.fromString('createdBy'),
                  isEqualTo: _initC.uid(),
                )
                .count()
                .get();

            if (dataUser.count == 0) {
              Get.offAllNamed(Routes.REGISTER_FORM);
            } else {
              Get.offAllNamed(
                Routes.MAIN,
                arguments: role,
              );
            }
          }
        }
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    } on FirebaseException catch (e) {
      _initC.logger.e(
        'Error checkAuth ',
        error: e,
        stackTrace: e.stackTrace,
      );
      Get.offAllNamed(Routes.LOGIN);
    }

    // _initC.auth.authStateChanges().listen((user) async {
    //   if (user == null) {
    //     if (_isUserFirstUsingApp() != null &&
    //         _isUserFirstUsingApp()! &&
    //         role != null) {
    //       _initC.localStorage.remove(ConstantsValues.role);

    //       Get.snackbar(
    //         'Peringatan',
    //         'Anda telah dikeluarkan dari aplikasi, harap login kembali',
    //         snackPosition: SnackPosition.BOTTOM,
    //         icon: Icon(
    //           Icons.info_rounded,
    //           color: colorScheme.error,
    //         ),
    //         backgroundColor: colorScheme.errorContainer,
    //         colorText: colorScheme.error,
    //       );
    //     }

    //     Get.offAllNamed(Routes.LOGIN);

    //     _initC.logger.i('User is currently signed out!');
    //   } else {
    //     _initC.logger.d('debug: username = ${_initC.auth.currentUser}');
    //     _initC.logger.d('debug: role = $role');

    //     if (role != null) {
    //       if (role == ROLE.admin.name) {
    //         Get.offAllNamed(
    //           Routes.MAIN,
    //           arguments: role,
    //         );
    //       } else {
    //         // cek jika user sudah mengisi form maka arahkan ke main view
    //         final dataUser = await _initC.firestore
    //             .collection(ConstantsValuesFirebase.colStudentForm)
    //             .where(
    //               FieldPath.fromString('createdBy'),
    //               isEqualTo: user.uid,
    //             )
    //             .count()
    //             .get();

    //         if (dataUser.count == 0) {
    //           Get.offAllNamed(Routes.REGISTER_FORM);
    //         } else {
    //           Get.offAllNamed(
    //             Routes.MAIN,
    //             arguments: role,
    //           );
    //         }
    //       }
    //     } else {
    //       _initC.auth.signOut();
    //       _initC.logger.d('debug: role tidak ditemukan');
    //     }

    //     _initC.logger.i('User is signed in!');
    //   }
    // });
  }
}
