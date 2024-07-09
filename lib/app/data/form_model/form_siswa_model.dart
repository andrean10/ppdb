import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:ppdb/app/data/countries_model/countries_model.dart';
import 'package:ppdb/app/data/special_needs_model/special_needs_model.dart';

part 'form_siswa_model.freezed.dart';
part 'form_siswa_model.g.dart';

@freezed
class FormSiswaModel with _$FormSiswaModel {
  const factory FormSiswaModel({
    required String? fullName,
    required String? gender,
    required CountriesModel? nationality,
    required String? nik,
    required String? noKK,
    required String? placeBirth,
    required DateTime? dateBirth,
    required String? birthCertificateRegistration,
    SpecialNeedsModel? specialNeeds,
    required String? religion,
    required String? address,
    required String? rt,
    required String? rw,
    required String? nameHamlet,
    required String? postalCode,
    required String? residence,
    required String? transportation,
    required String? childTo,
    required String? fatherName,
    required String? nikFather,
    required String? motherName,
    required String? nikMother,
    required String? createdBy,
    required DateTime? createdAt,
    DateTime? updatedAt,
  }) = _FormSiswaModel;

  factory FormSiswaModel.fromJson(Map<String, Object?> json) =>
      _$FormSiswaModelFromJson(json);
}
