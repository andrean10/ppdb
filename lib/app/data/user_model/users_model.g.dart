// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersModelImpl _$$UsersModelImplFromJson(Map<String, dynamic> json) =>
    _$UsersModelImpl(
      username: json['username'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      isApproved: json['isApproved'] as bool?,
      isConfirmed: json['isConfirmed'] as bool?,
    );

Map<String, dynamic> _$$UsersModelImplToJson(_$UsersModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'role': instance.role,
      'isApproved': instance.isApproved,
      'isConfirmed': instance.isConfirmed,
    };
