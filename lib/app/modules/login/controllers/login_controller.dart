import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/modules/init/controllers/init_controller.dart';
import 'package:ppdb/utils/constants_values.dart';
import 'package:ppdb/utils/constants_values_firebase.dart';
import '../../../data/user_model/users_model.dart';
import '../../../routes/app_pages.dart';
import '../../main/controllers/main_controller.dart';

class LoginController extends GetxController {
  late final InitController _initC;
  final formKey = GlobalKey<FormState>();

  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  final emailF = FocusNode();
  final passwordF = FocusNode();

  final email = ''.obs;
  final password = ''.obs;

  final isHidePassword = true.obs;
  final isLoading = false.obs;
  final errMsg = RxnString();

  // Map<String, String>? args;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _initTextController();
  }

  @override
  void onReady() {
    super.onReady();
    // args = Get.arguments as Map<String, String>?;

    // _initTextWhenRegister();
  }

  void _initTextController() {
    emailC.addListener(_setEmail);
    passwordC.addListener(_setPassword);
  }

  // void _initTextWhenRegister() {
  //   emailC.text = args?['email'].toString() ?? '';
  //   passwordC.text = args?['password'].toString() ?? '';
  // }

  void _setEmail() => email.value = emailC.text;

  void _setPassword() => password.value = passwordC.text;

  void setHidePassword() => isHidePassword.toggle();

  void confirm() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();

    _checkUser();
  }

  Future<void> _checkUser() async {
    _isLoading(true);

    try {
      final userCredential = await _initC.auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      final user = await _initC.firestore
          .collection(ConstantsValuesFirebase.colUser)
          .withConverter(
            fromFirestore: (snapshot, _) =>
                UsersModel.fromJson(snapshot.data()!),
            toFirestore: (value, _) => value.toJson(),
          )
          .doc(userCredential.user?.uid)
          .get();

      if (user.exists) {
        final userModel = user.data();
        await _initC.localStorage.write(ConstantsValues.role, userModel?.role);

        // cek role
        if (userModel?.role == ROLE.admin.name ||
            userModel?.role == ROLE.kepsek.name) {
          Get.offAllNamed(
            Routes.MAIN,
            arguments: userModel!.role,
          );
        } else {
          // cek jika user sudah mengisi form maka arahkan ke main view
          final dataUser = await _initC.firestore
              .collection(ConstantsValuesFirebase.colStudentForm)
              .where(
                FieldPath.fromString('createdBy'),
                isEqualTo: user.id,
              )
              .count()
              .get();

          if (dataUser.count == 0) {
            Get.offAllNamed(Routes.REGISTER_FORM);
          } else {
            Get.offAllNamed(
              Routes.MAIN,
              arguments: userModel!.role,
            );
          }
        }
      } else {
        errMsg.value = 'User belum terdaftar';
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          errMsg.value = 'User belum terdaftar';
          break;
        case 'wrong-password':
          errMsg.value = 'Password yang anda masukkan salah';
          break;
        default:
          errMsg.value =
              'Kesalahan login, pastikan email dan password anda sudah benar';
          break;
      }

      _initC.logger.e(
        'Error sign in = ${e.code}',
        error: e,
        stackTrace: e.stackTrace,
      );
    } finally {
      _isLoading(false);
    }
  }

  void moveToMain() => Get.offAllNamed(Routes.MAIN);

  void moveToRegister() => Get.toNamed(Routes.REGISTER);

  void _isLoading(bool state) {
    if (state) {
      isLoading.value = true;
      errMsg.value = null;
    } else {
      isLoading.value = false;
    }
  }
}
