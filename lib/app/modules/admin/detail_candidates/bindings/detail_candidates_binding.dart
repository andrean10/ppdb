import 'package:get/get.dart';

import '../controllers/detail_candidates_controller.dart';

class DetailCandidatesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DetailCandidatesController>(DetailCandidatesController());
  }
}
