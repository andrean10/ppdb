import 'package:get/get.dart';

import '../controllers/socmed_controller.dart';

class SocmedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocmedController>(() => SocmedController());
  }
}
