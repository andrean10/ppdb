import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/data/user_model/users_model.dart';
import 'package:ppdb/app/modules/init/controllers/init_controller.dart';
import 'package:ppdb/app/modules/main/controllers/main_controller.dart';
import 'package:ppdb/shared/shared_method.dart';
import 'package:ppdb/shared/shared_theme.dart';
import 'package:ppdb/utils/constants_values.dart';

import '../../../../utils/constants_values_firebase.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  late final InitController _initC;
  final formKey = GlobalKey<FormState>();

  final usernameC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  final usernameF = FocusNode();
  final emailF = FocusNode();
  final passwordF = FocusNode();

  final username = ''.obs;
  final email = ''.obs;
  final password = ''.obs;

  final isHidePassword = false.obs;
  final isLoading = false.obs;
  final errMsg = RxnString();

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

  void _initTextController() {
    usernameC.addListener(_setUsername);
    emailC.addListener(_setEmail);
    passwordC.addListener(_setPassword);
  }

  void _setUsername() => username.value = usernameC.text;

  void _setEmail() => email.value = emailC.text;

  void _setPassword() => password.value = passwordC.text;

  void setHidePassword() => isHidePassword.toggle();

  void confirm() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();

    _registerUser();
  }

  void _registerUser() async {
    _isLoading(true);

    final data = UsersModel(
      email: email.value,
      username: username.value,
      role: ROLE.user.name,
      isApproved: false,
      isConfirmed: false,
    );

    try {
      // create authentication from firebase auth
      final userCredential = await _initC.auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      await userCredential.user?.updateDisplayName(username.value);

      // write firestore
      await _initC.firestore
          .collection(ConstantsValuesFirebase.colUser)
          .doc(userCredential.user?.uid)
          .set(data.toJson());

      // write shared preferences
      await _initC.localStorage.write(
        ConstantsValues.role,
        ROLE.user.name,
      );

      showSnackbar(
        content: 'Mantap... kamu sudah bisa menggunakan akun untuk login',
        backgroundColor: Get.isDarkMode
            ? SharedTheme.darkSuccessColor
            : SharedTheme.lightSuccessColor,
        duration: 3.seconds,
      );

      // final map = {
      //   'username': username.value,
      //   'password': password.value,
      // };

      // moveToLogin(map: map);
      moveToRegisterForm();
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          errMsg.value = 'Email sudah terdaftar sebelumnya';
          break;
        case 'weak-password':
          errMsg.value =
              'Password terlalu lemah, ganti dengan password yang lebih kuat';
        default:
          errMsg.value =
              'Kesalahan registrasi, silahkan ulangi beberapa saat lagi';
          break;
      }

      _initC.logger.e(
        'Error: register user',
        error: e,
        stackTrace: e.stackTrace,
      );
    } finally {
      _isLoading(false);
    }
  }

  void moveToRegisterForm() => Get.offAllNamed(Routes.REGISTER_FORM);

  void moveToLogin() => Get.back();

  void _isLoading(bool state) {
    if (state) {
      isLoading.value = true;
      errMsg.value = null;
    } else {
      isLoading.value = false;
    }
  }
}
