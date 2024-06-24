import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ppdb/app/data/login_model/login_model.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
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

  final logger = Logger();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    _initTextController();
  }

  void _initTextController() {
    emailC.addListener(_setEmail);
    passwordC.addListener(_setPassword);
  }

  void _setEmail() => email.value = emailC.text;

  void _setPassword() => password.value = passwordC.text;

  void setHidePassword() => isHidePassword.toggle();

  void confirm() {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    FocusScope.of(Get.context!).unfocus();

    final data = LoginModel(
      email: email.value,
      password: password.value,
    );

    moveToMain();
  }

  void moveToMain() => Get.offAllNamed(Routes.REGISTER_FORM);

  void moveToLogin() => Get.back();
}
