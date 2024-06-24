import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ppdb/app/data/countries_model/countries_model.dart';
import 'package:ppdb/app/data/countries_model/res_countries_model.dart';
import 'package:ppdb/app/modules/init/controllers/init_controller.dart';
import 'package:ppdb/services/countries_service/countries_connect.dart';
import 'package:ppdb/services/special_needs_service/special_needs_connect.dart';

import '../../../data/special_needs_model/special_needs_model.dart';
import '../../../helpers/format_date_time.dart';

class RegisterFormController extends GetxController {
  late final InitController _initC;
  late final CountriesConnect _countriesC;
  late final SpecialNeedsConnect _specialNeedsC;
  // late final ReligionConnect _religionC;

  final formKey = GlobalKey<FormState>();

  final fullNameC = TextEditingController();
  final genderC = TextEditingController();
  final nationalityC = TextEditingController();
  final nikC = TextEditingController();
  final noKKC = TextEditingController();
  final placeBirthC = TextEditingController();
  final dateBirthC = TextEditingController();
  final noRegistAktaLahirC = TextEditingController();
  final specialNeedsC = TextEditingController();
  final religionC = TextEditingController();
  final addressC = TextEditingController();
  final rtC = TextEditingController();
  final rwC = TextEditingController();
  final nameHamletC = TextEditingController();
  final postalCodeC = TextEditingController();
  final residenceC = TextEditingController();
  final transportC = TextEditingController();
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
  final noRegistAktaLahirF = FocusNode();
  final specialNeedsF = FocusNode();
  final religionF = FocusNode();
  final addressF = FocusNode();
  final rtF = FocusNode();
  final rwF = FocusNode();
  final nameHamletF = FocusNode();
  final postalCodeF = FocusNode();
  final residenceF = FocusNode();
  final transportF = FocusNode();
  final childToF = FocusNode();
  final fatherNameF = FocusNode();
  final nikFatherF = FocusNode();
  final motherNameF = FocusNode();
  final nikMotherF = FocusNode();

  final fullName = ''.obs;
  final gender = ''.obs;
  final nationality = ''.obs;
  final nik = ''.obs;
  final noKK = ''.obs;
  final placeBirth = ''.obs;
  final dateBirth = Rxn<DateTime>();
  final noRegistAktaLahir = ''.obs;
  final specialNeeds = Rxn<SpecialNeedsModel>();
  final religion = ''.obs;
  final address = ''.obs;
  final rt = ''.obs;
  final rw = ''.obs;
  final nameHamlet = ''.obs;
  final postalCode = ''.obs;
  final residence = ''.obs;
  final transport = ''.obs;
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

  final tempDataCountries = <CountriesModel>[];
  final tempDataSpecialNeeds = <SpecialNeedsModel>[];

  final isLoading = false.obs;

  final logger = Logger();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _countriesC = CountriesConnect();
    _specialNeedsC = SpecialNeedsConnect(_initC.firestore);
    // _religionC = ReligionConnect(_initC.firestore);

    _initListenerTextController();
  }

  void _initListenerTextController() {
    fullNameC.addListener(setFullName);
    religionC.addListener(setReligion);
  }

  void setFullName() => fullName.value = fullNameC.text;

  void setGender(String? value) => gender.value = value ?? '';

  void setNationality(CountriesModel? value) =>
      nationality.value = value?.unicodeFlag ?? '';

  void setBirthDate(DateTime selectedDateTime) {
    dateBirthC.text = FormatDateTime.dateToString(
      newPattern: 'dd MMMM yyyy',
      value: selectedDateTime.toString(),
    );
    dateBirth.value = selectedDateTime;
  }

  void setSpecialNeeds(SpecialNeedsModel? value) {
    if (value != null) {
      specialNeedsC.text = value.title ?? '';
      specialNeeds.value = value;
    }
  }

  void setReligion() => religion.value = religionC.text;

  Future<List<CountriesModel>> fetchAllCountries() async {
    try {
      if (tempDataCountries.isEmpty) {
        final res = await _countriesC.fetchCountries;

        if (res.isOk) {
          Map<String, dynamic>? mapRes = res.body;

          if (mapRes != null && mapRes.isNotEmpty) {
            final resCountries = ResCountriesModel.fromJson(mapRes);

            if (resCountries.data != null && resCountries.data!.isNotEmpty) {
              // set to temporary
              tempDataCountries.addAll(resCountries.data!);
            }
          }
        }
      }

      return tempDataCountries;
    } catch (e) {
      logger.e('Error fetching all countries = $e');
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
      logger.e('Error fetching all countries = $e');
    }

    return tempDataSpecialNeeds;
  }

  Future<List<SpecialNeedsModel>> fetchAllReligion() async {
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
      logger.e('Error fetching all countries = $e');
    }

    return tempDataSpecialNeeds;
  }
}
