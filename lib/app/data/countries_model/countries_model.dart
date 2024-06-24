import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'countries_model.freezed.dart';
part 'countries_model.g.dart';

@freezed
class CountriesModel with _$CountriesModel {
  const factory CountriesModel({
    required String? name,
    required String? flag,
    required String? unicodeFlag,
  }) = _CountriesModel;

  factory CountriesModel.fromJson(Map<String, Object?> json) =>
      _$CountriesModelFromJson(json);
}