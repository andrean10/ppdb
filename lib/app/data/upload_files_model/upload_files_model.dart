import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'upload_files_model.freezed.dart';
part 'upload_files_model.g.dart';

@freezed
class UploadFilesModel with _$UploadFilesModel {
  const factory UploadFilesModel({
    final String? familyCard,
    final String? birthCertificate,
    final String? ktpFather,
    final String? ktpMom,
    final String? certificate,
    final String? photo,
  }) = _UploadFilesModel;

  factory UploadFilesModel.fromJson(Map<String, dynamic> json) =>
      _$UploadFilesModelFromJson(json);
}
