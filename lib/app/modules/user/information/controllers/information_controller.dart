import 'package:get/get.dart';
import 'package:logger/logger.dart';

class InformationController extends GetxController {
  final logger = Logger();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {}

  void moveToMain() => Get.back();

  void moveToProfile() {
  }
}
