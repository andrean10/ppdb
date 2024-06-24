import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final logger = Logger();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    Future.delayed(5.seconds, () => moveToMain());
  }

  void moveToMain() {
    Get.offAllNamed(
      Routes.LOGIN,
    );
  }
}
