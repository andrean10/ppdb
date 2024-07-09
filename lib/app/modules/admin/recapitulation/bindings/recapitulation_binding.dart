import 'package:get/get.dart';

import '../controllers/recapitulation_controller.dart';

class RecapitulationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecapitulationController>(
      () => RecapitulationController(),
    );
  }
}
