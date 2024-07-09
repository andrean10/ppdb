import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppdb/app/data/form_model/form_siswa_model.dart';
import 'package:ppdb/app/data/upload_files_model/upload_files_model.dart';
import 'package:ppdb/app/data/user_model/users_model.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required UsersModel user,
    FormSiswaModel? formSiswa,
    UploadFilesModel? uploadFiles,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
