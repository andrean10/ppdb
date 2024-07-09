import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/data/form_model/form_siswa_model.dart';
import 'package:ppdb/app/modules/init/controllers/init_controller.dart';
import 'package:ppdb/utils/constants_values_firebase.dart';

class ProspectiveStudentDataController extends GetxController {
  late final InitController _initC;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }
  }

  Future<QuerySnapshot<FormSiswaModel>> fetchStudentForm() {
    final uid = _initC.auth.currentUser?.uid;
    return _initC.firestore
        .collection(ConstantsValuesFirebase.colStudentForm)
        .withConverter(
          fromFirestore: (snapshot, _) =>
              FormSiswaModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        )
        .where(FieldPath.fromString('createdBy'), isEqualTo: uid)
        .limit(1)
        .get();
  }
}
