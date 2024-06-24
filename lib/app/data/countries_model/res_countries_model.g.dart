// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_countries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResCountriesModelImpl _$$ResCountriesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResCountriesModelImpl(
      error: json['error'] as bool?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CountriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResCountriesModelImplToJson(
        _$ResCountriesModelImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'msg': instance.msg,
      'data': instance.data,
    };
