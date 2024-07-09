// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  UsersModel get user => throw _privateConstructorUsedError;
  FormSiswaModel? get formSiswa => throw _privateConstructorUsedError;
  UploadFilesModel? get uploadFiles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call(
      {UsersModel user,
      FormSiswaModel? formSiswa,
      UploadFilesModel? uploadFiles});

  $UsersModelCopyWith<$Res> get user;
  $FormSiswaModelCopyWith<$Res>? get formSiswa;
  $UploadFilesModelCopyWith<$Res>? get uploadFiles;
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? formSiswa = freezed,
    Object? uploadFiles = freezed,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UsersModel,
      formSiswa: freezed == formSiswa
          ? _value.formSiswa
          : formSiswa // ignore: cast_nullable_to_non_nullable
              as FormSiswaModel?,
      uploadFiles: freezed == uploadFiles
          ? _value.uploadFiles
          : uploadFiles // ignore: cast_nullable_to_non_nullable
              as UploadFilesModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsersModelCopyWith<$Res> get user {
    return $UsersModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FormSiswaModelCopyWith<$Res>? get formSiswa {
    if (_value.formSiswa == null) {
      return null;
    }

    return $FormSiswaModelCopyWith<$Res>(_value.formSiswa!, (value) {
      return _then(_value.copyWith(formSiswa: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UploadFilesModelCopyWith<$Res>? get uploadFiles {
    if (_value.uploadFiles == null) {
      return null;
    }

    return $UploadFilesModelCopyWith<$Res>(_value.uploadFiles!, (value) {
      return _then(_value.copyWith(uploadFiles: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
          _$ProfileModelImpl value, $Res Function(_$ProfileModelImpl) then) =
      __$$ProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UsersModel user,
      FormSiswaModel? formSiswa,
      UploadFilesModel? uploadFiles});

  @override
  $UsersModelCopyWith<$Res> get user;
  @override
  $FormSiswaModelCopyWith<$Res>? get formSiswa;
  @override
  $UploadFilesModelCopyWith<$Res>? get uploadFiles;
}

/// @nodoc
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
      _$ProfileModelImpl _value, $Res Function(_$ProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? formSiswa = freezed,
    Object? uploadFiles = freezed,
  }) {
    return _then(_$ProfileModelImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UsersModel,
      formSiswa: freezed == formSiswa
          ? _value.formSiswa
          : formSiswa // ignore: cast_nullable_to_non_nullable
              as FormSiswaModel?,
      uploadFiles: freezed == uploadFiles
          ? _value.uploadFiles
          : uploadFiles // ignore: cast_nullable_to_non_nullable
              as UploadFilesModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileModelImpl implements _ProfileModel {
  const _$ProfileModelImpl(
      {required this.user, this.formSiswa, this.uploadFiles});

  factory _$ProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileModelImplFromJson(json);

  @override
  final UsersModel user;
  @override
  final FormSiswaModel? formSiswa;
  @override
  final UploadFilesModel? uploadFiles;

  @override
  String toString() {
    return 'ProfileModel(user: $user, formSiswa: $formSiswa, uploadFiles: $uploadFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.formSiswa, formSiswa) ||
                other.formSiswa == formSiswa) &&
            (identical(other.uploadFiles, uploadFiles) ||
                other.uploadFiles == uploadFiles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, formSiswa, uploadFiles);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileModel implements ProfileModel {
  const factory _ProfileModel(
      {required final UsersModel user,
      final FormSiswaModel? formSiswa,
      final UploadFilesModel? uploadFiles}) = _$ProfileModelImpl;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$ProfileModelImpl.fromJson;

  @override
  UsersModel get user;
  @override
  FormSiswaModel? get formSiswa;
  @override
  UploadFilesModel? get uploadFiles;
  @override
  @JsonKey(ignore: true)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
