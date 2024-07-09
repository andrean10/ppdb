import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppdb/app/data/countries_model/countries_model.dart';
import 'package:ppdb/app/data/countries_model/res_countries_model.dart';
import 'package:ppdb/app/data/form_model/form_siswa_model.dart';
import 'package:ppdb/app/modules/init/controllers/init_controller.dart';
import 'package:ppdb/app/modules/main/controllers/main_controller.dart';
import 'package:ppdb/services/countries_service/countries_connect.dart';
import 'package:ppdb/services/special_needs_service/special_needs_connect.dart';
import 'package:ppdb/utils/constants_values_firebase.dart';

import '../../../data/special_needs_model/special_needs_model.dart';
import '../../../data/user_model/users_model.dart';
import '../../../helpers/format_date_time.dart';
import '../../../routes/app_pages.dart';

class RegisterFormController extends GetxController {
  late final InitController _initC;
  late final CountriesConnect _countriesC;
  late final SpecialNeedsConnect _specialNeedsC;

  final formKey = GlobalKey<FormState>();

  final fullNameC = TextEditingController();
  final genderC = TextEditingController();
  final nationalityC = TextEditingController();
  final nikC = TextEditingController();
  final noKKC = TextEditingController();
  final placeBirthC = TextEditingController();
  final dateBirthC = TextEditingController();
  final birthCertificateRegistrationC = TextEditingController();
  final specialNeedsC = TextEditingController();
  final religionC = TextEditingController();
  final addressC = TextEditingController();
  final rtC = TextEditingController();
  final rwC = TextEditingController();
  final nameHamletC = TextEditingController();
  final postalCodeC = TextEditingController();
  final residenceC = TextEditingController();
  final transportationC = TextEditingController();
  final childToC = TextEditingController();
  final fatherNameC = TextEditingController();
  final nikFatherC = TextEditingController();
  final motherNameC = TextEditingController();
  final nikMotherC = TextEditingController();

  final fullNameF = FocusNode();
  final genderF = FocusNode();
  final nationalityF = FocusNode();
  final nikF = FocusNode();
  final noKKF = FocusNode();
  final placeBirthF = FocusNode();
  final dateBirthF = FocusNode();
  final birthCertificateRegistrationF = FocusNode();
  final specialNeedsF = FocusNode();
  final religionF = FocusNode();
  final addressF = FocusNode();
  final rtF = FocusNode();
  final rwF = FocusNode();
  final nameHamletF = FocusNode();
  final postalCodeF = FocusNode();
  final residenceF = FocusNode();
  final transportationF = FocusNode();
  final childToF = FocusNode();
  final fatherNameF = FocusNode();
  final nikFatherF = FocusNode();
  final motherNameF = FocusNode();
  final nikMotherF = FocusNode();

  final fullName = ''.obs;
  final gender = ''.obs;
  final nationality = Rxn<CountriesModel>();
  final nik = ''.obs;
  final noKK = ''.obs;
  final placeBirth = ''.obs;
  final dateBirth = Rxn<DateTime>();
  final birthCertificateRegistration = ''.obs;
  final specialNeeds = Rxn<SpecialNeedsModel>();
  final religion = ''.obs;
  final address = ''.obs;
  final rt = ''.obs;
  final rw = ''.obs;
  final nameHamlet = ''.obs;
  final postalCode = ''.obs;
  final residence = ''.obs;
  final transportation = ''.obs;
  final childTo = ''.obs;
  final fatherName = ''.obs;
  final nikFather = ''.obs;
  final motherName = ''.obs;
  final nikMother = ''.obs;

  final dataGender = {
    'L': 'Laki-laki',
    'P': 'Perempuan',
  };

  final dataReligion = [
    'Islam',
    'Kristen',
    'Katolik',
    'Hindu',
    'Budha',
    'Konghucu'
  ];

  final dataResidence = [
    'Bersama Orang Tua',
    'Wali',
    'Kost',
    'Asrama',
    'Panti Asuhan',
    'Pesantren',
    'Lainnya',
  ];

  final dataTransportation = [
    'Jalan kaki',
    'Angkutan umum/bus/pete-pete',
    'Mobil/bus antar jemput',
    'Kereta api',
    'Ojek',
    'Andong/bendi/sado/dokar/delman/becak',
    'Perahu penyeberangan/rakit/getek',
    'Kuda',
    'Sepeda'
  ];

  final tempDataCountries = <CountriesModel>[];
  final tempDataSpecialNeeds = <SpecialNeedsModel>[];

  UsersModel? data;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _init();

    debounce(dateBirth, (dateTime) {
      dateBirthC.text = FormatDateTime.dateToString(
        newPattern: 'dd MMMM yyyy',
        value: dateTime.toString(),
      );
    });
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    data = Get.arguments as UsersModel?;

    _countriesC = CountriesConnect();
    _specialNeedsC = SpecialNeedsConnect(_initC.firestore);

    _initListenerTextController();
  }

  void _initListenerTextController() {
    fullNameC.addListener(setFullName);
    nikC.addListener(setNIK);
    noKKC.addListener(setNOKK);
    placeBirthC.addListener(setPlaceBirth);
    birthCertificateRegistrationC.addListener(setNoRegisAktaLahir);
    addressC.addListener(setAddress);
    rtC.addListener(setRT);
    rwC.addListener(setRW);
    nameHamletC.addListener(setNameHamlet);
    postalCodeC.addListener(setPostalCode);
    childToC.addListener(setChildTo);
    fatherNameC.addListener(setFatherName);
    nikFatherC.addListener(setNIKFather);
    motherNameC.addListener(setMotherName);
    nikMotherC.addListener(setNIKMother);
  }

  void setFullName() => fullName.value = fullNameC.text;

  void setGender(String? value) => gender.value = value ?? '';

  void setNationality(CountriesModel? value) => nationality.value = value;

  void setNIK() => nik.value = nikC.text;

  void setNOKK() => noKK.value = noKKC.text;

  void setPlaceBirth() => placeBirth.value = placeBirthC.text;

  void setBirthDate(DateTime selectedDateTime) {
    dateBirth.value = selectedDateTime;
  }

  void setNoRegisAktaLahir() =>
      birthCertificateRegistration.value = birthCertificateRegistrationC.text;

  void setSpecialNeeds(SpecialNeedsModel? value) {
    if (value != null) {
      specialNeedsC.text = value.title ?? '';
      specialNeeds.value = value;
    }
  }

  void setReligion(String? value) {
    if (value != null) {
      religionC.text = value;
      religion.value = value;
    }
  }

  void setAddress() => address.value = addressC.text;

  void setRT() => rt.value = rtC.text;

  void setRW() => rw.value = rwC.text;

  void setNameHamlet() => nameHamlet.value = nameHamletC.text;

  void setPostalCode() => postalCode.value = postalCodeC.text;

  void setResidence(String? value) {
    if (value != null) {
      residenceC.text = value;
      residence.value = value;
    }
  }

  void setTransportation(String? value) {
    if (value != null) {
      transportationC.text = value;
      transportation.value = value;
    }
  }

  void setChildTo() {
    childTo.value = (childToC.text.startsWith('0'))
        ? childToC.text.replaceFirst('0', '')
        : childToC.text;
  }

  void setFatherName() => fatherName.value = fatherNameC.text;

  void setNIKFather() => nikFather.value = nikFatherC.text;

  void setMotherName() => motherName.value = motherNameC.text;

  void setNIKMother() => nikMother.value = nikMotherC.text;

  void confirm() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(Get.context!).unfocus();

    _insertData();
  }

  void _insertData() async {
    isLoading.value = true;

    final data = FormSiswaModel(
      fullName: fullName.value,
      gender: gender.value,
      nationality: nationality.value,
      nik: nik.value,
      noKK: noKK.value,
      placeBirth: placeBirth.value,
      dateBirth: dateBirth.value,
      birthCertificateRegistration: birthCertificateRegistration.value,
      specialNeeds: specialNeeds.value,
      religion: religion.value,
      address: address.value,
      rt: rt.value,
      rw: rw.value,
      nameHamlet: nameHamlet.value,
      postalCode: postalCode.value,
      residence: residence.value,
      transportation: transportation.value,
      childTo: childTo.value,
      fatherName: fatherName.value,
      nikFather: nikFather.value,
      motherName: motherName.value,
      nikMother: nikMother.value,
      createdBy: _initC.auth.currentUser?.uid,
      createdAt: DateTime.now(),
    );

    _initC.logger.d('debug: data = $data');

    try {
      await _initC.firestore
          .collection(ConstantsValuesFirebase.colStudentForm)
          .add(data.toJson());
      moveToMain();
    } on FirebaseException catch (e) {
      _initC.logger.e(
        'error: insert data',
        error: e,
        stackTrace: e.stackTrace,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<CountriesModel>> fetchAllCountries() async {
    try {
      if (tempDataCountries.isEmpty) {
        final res = await _countriesC.fetchCountries;

        if (res.isOk) {
          Map<String, dynamic>? mapRes = res.body;

          if (mapRes != null && mapRes.isNotEmpty) {
            final resCountries = ResCountriesModel.fromJson(mapRes);

            if (resCountries.data != null && resCountries.data!.isNotEmpty) {
              final dataCountries = resCountries.data!;
              final dataID = dataCountries
                  .singleWhere((element) => element.name == 'Indonesia');
              final newDataCountries = dataCountries
                  .takeWhile((value) => value.name != 'Indonesia')
                  .toList();

              // Insert indonesia in first data
              newDataCountries.insert(0, dataID);

              // set to temporary
              tempDataCountries.addAll(newDataCountries);
            }
          }
        }
      }

      return tempDataCountries;
    } catch (e) {
      _initC.logger.e('Error fetching all countries = $e');
    }

    return tempDataCountries;
  }

  Future<List<SpecialNeedsModel>> fetchAllSpecialNeeds() async {
    try {
      if (tempDataSpecialNeeds.isEmpty) {
        final res = await _specialNeedsC.fetchSpecialNeeds;
        final data = res.docs.map((e) => e.data()).toList();

        if (data.isNotEmpty) {
          tempDataSpecialNeeds.addAll(data);
        }
      }

      return tempDataSpecialNeeds;
    } catch (e) {
      _initC.logger.e('Error fetching all countries = $e');
    }

    return tempDataSpecialNeeds;
  }

  void moveToMain() {
    Get.offAllNamed(
      Routes.MAIN,
      arguments: ROLE.user.name,
    );
  }
}
