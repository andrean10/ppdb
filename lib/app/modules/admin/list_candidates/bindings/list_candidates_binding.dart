import 'package:get/get.dart';

import '../controllers/list_candidates_controller.dart';

class ListCandidatesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListCandidatesController>(() => ListCandidatesController());
  }
}
