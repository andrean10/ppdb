import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../data/login_model/login_model.dart';
import '../../../routes/app_pages.dart';
import '../../main/controllers/main_controller.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  final emailF = FocusNode();
  final passwordF = FocusNode();

  final email = ''.obs;
  final password = ''.obs;

  final isHidePassword = true.obs;

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
    moveToMain();

    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();

    final data = LoginModel(
      email: email.value,
      password: password.value,
    );
  }

  void moveToMain() => Get.offAllNamed(Routes.MAIN, arguments: ROLE.USER);

  void moveToRegister() => Get.toNamed(Routes.REGISTER);
}
