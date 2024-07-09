// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_files_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadFilesModelImpl _$$UploadFilesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadFilesModelImpl(
      familyCard: json['familyCard'] as String?,
      birthCertificate: json['birthCertificate'] as String?,
      ktpFather: json['ktpFather'] as String?,
      ktpMom: json['ktpMom'] as String?,
      certificate: json['certificate'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$$UploadFilesModelImplToJson(
        _$UploadFilesModelImpl instance) =>
    <String, dynamic>{
      'familyCard': instance.familyCard,
      'birthCertificate': instance.birthCertificate,
      'ktpFather': instance.ktpFather,
      'ktpMom': instance.ktpMom,
      'certificate': instance.certificate,
      'photo': instance.photo,
    };
