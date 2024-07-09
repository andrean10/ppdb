import 'package:get/get.dart';

import '../controllers/prospective_student_data_controller.dart';

class ProspectiveStudentDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProspectiveStudentDataController>(
        () => ProspectiveStudentDataController());
  }
}
