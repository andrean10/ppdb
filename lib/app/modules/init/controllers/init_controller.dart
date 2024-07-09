import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:ppdb/utils/constants_values.dart';

class InitController extends GetxController {
  late final FirebaseFirestore _firestore;
  late final FirebaseAuth _auth;
  late final FirebaseStorage _cloudStorage;
  late final GetStorage _localStorage;

  FirebaseAuth get auth => _auth;

  FirebaseFirestore get firestore => _firestore;

  FirebaseStorage get cloudStorage => _cloudStorage;

  GetStorage get localStorage => _localStorage;

  final logger = Logger(printer: PrettyPrinter());

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    _firestore = FirebaseFirestore.instance;
    _auth = FirebaseAuth.instance;
    _cloudStorage = FirebaseStorage.instance;
    _localStorage = GetStorage();

    _localStorage.writeIfNull(
      ConstantsValues.isFirstUsingApp,
      true,
    );
  }

  String? uid() => auth.currentUser?.uid;

  Future<void> clearWhenLogout() async {
    await localStorage.remove(ConstantsValues.role);
    await auth.signOut();
  }
}
