import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'special_needs_model.freezed.dart';
part 'special_needs_model.g.dart';

@freezed
class SpecialNeedsModel with _$SpecialNeedsModel {
  const factory SpecialNeedsModel({
    final String? title,
    final String? category,
  }) = _SpecialNeedsModel;

  factory SpecialNeedsModel.fromJson(Map<String, dynamic> json) =>
      _$SpecialNeedsModelFromJson(json);
}
