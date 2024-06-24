import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class InitController extends GetxController {
  late final FirebaseFirestore _firestore;

  FirebaseFirestore get firestore => _firestore;

  final logger = Logger();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    _firestore = FirebaseFirestore.instance;
  }
}
