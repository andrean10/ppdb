// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      user: UsersModel.fromJson(json['user'] as Map<String, dynamic>),
      formSiswa: json['formSiswa'] == null
          ? null
          : FormSiswaModel.fromJson(json['formSiswa'] as Map<String, dynamic>),
      uploadFiles: json['uploadFiles'] == null
          ? null
          : UploadFilesModel.fromJson(
              json['uploadFiles'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'formSiswa': instance.formSiswa,
      'uploadFiles': instance.uploadFiles,
    };
