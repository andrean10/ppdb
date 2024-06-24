import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'countries_model.dart';

part 'res_countries_model.freezed.dart';
part 'res_countries_model.g.dart';

@freezed
class ResCountriesModel with _$ResCountriesModel {
  const factory ResCountriesModel({
    required bool? error,
    required String? msg,
    required List<CountriesModel>? data,
  }) = _ResCountriesModel;

  factory ResCountriesModel.fromJson(Map<String, Object?> json) =>
      _$ResCountriesModelFromJson(json);
}