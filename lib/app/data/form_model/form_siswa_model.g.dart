// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_siswa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormSiswaModelImpl _$$FormSiswaModelImplFromJson(Map<String, dynamic> json) =>
    _$FormSiswaModelImpl(
      fullName: json['fullName'] as String?,
      gender: json['gender'] as String?,
      nationality: json['nationality'] == null
          ? null
          : CountriesModel.fromJson(
              json['nationality'] as Map<String, dynamic>),
      nik: json['nik'] as String?,
      noKK: json['noKK'] as String?,
      placeBirth: json['placeBirth'] as String?,
      dateBirth: json['dateBirth'] == null
          ? null
          : DateTime.parse(json['dateBirth'] as String),
      birthCertificateRegistration:
          json['birthCertificateRegistration'] as String?,
      specialNeeds: json['specialNeeds'] == null
          ? null
          : SpecialNeedsModel.fromJson(
              json['specialNeeds'] as Map<String, dynamic>),
      religion: json['religion'] as String?,
      address: json['address'] as String?,
      rt: json['rt'] as String?,
      rw: json['rw'] as String?,
      nameHamlet: json['nameHamlet'] as String?,
      postalCode: json['postalCode'] as String?,
      residence: json['residence'] as String?,
      transportation: json['transportation'] as String?,
      childTo: json['childTo'] as String?,
      fatherName: json['fatherName'] as String?,
      nikFather: json['nikFather'] as String?,
      motherName: json['motherName'] as String?,
      nikMother: json['nikMother'] as String?,
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$FormSiswaModelImplToJson(
        _$FormSiswaModelImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'gender': instance.gender,
      'nationality': instance.nationality?.toJson(),
      'nik': instance.nik,
      'noKK': instance.noKK,
      'placeBirth': instance.placeBirth,
      'dateBirth': instance.dateBirth?.toIso8601String(),
      'birthCertificateRegistration': instance.birthCertificateRegistration,
      'specialNeeds': instance.specialNeeds?.toJson(),
      'religion': instance.religion,
      'address': instance.address,
      'rt': instance.rt,
      'rw': instance.rw,
      'nameHamlet': instance.nameHamlet,
      'postalCode': instance.postalCode,
      'residence': instance.residence,
      'transportation': instance.transportation,
      'childTo': instance.childTo,
      'fatherName': instance.fatherName,
      'nikFather': instance.nikFather,
      'motherName': instance.motherName,
      'nikMother': instance.nikMother,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
