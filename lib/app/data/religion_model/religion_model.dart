import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'religion_model.freezed.dart';
part 'religion_model.g.dart';

@freezed
class ReligionModel with _$ReligionModel {
  const factory ReligionModel({
    required String? uid,
    required String? title,
  }) = _ReligionModel;

  factory ReligionModel.fromJson(Map<String, dynamic> json) =>
      _$ReligionModelFromJson(json);
}
