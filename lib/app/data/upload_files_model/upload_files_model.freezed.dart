// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_files_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadFilesModel _$UploadFilesModelFromJson(Map<String, dynamic> json) {
  return _UploadFilesModel.fromJson(json);
}

/// @nodoc
mixin _$UploadFilesModel {
  String? get familyCard => throw _privateConstructorUsedError;
  String? get birthCertificate => throw _privateConstructorUsedError;
  String? get ktpFather => throw _privateConstructorUsedError;
  String? get ktpMom => throw _privateConstructorUsedError;
  String? get certificate => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadFilesModelCopyWith<UploadFilesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadFilesModelCopyWith<$Res> {
  factory $UploadFilesModelCopyWith(
          UploadFilesModel value, $Res Function(UploadFilesModel) then) =
      _$UploadFilesModelCopyWithImpl<$Res, UploadFilesModel>;
  @useResult
  $Res call(
      {String? familyCard,
      String? birthCertificate,
      String? ktpFather,
      String? ktpMom,
      String? certificate,
      String? photo});
}

/// @nodoc
class _$UploadFilesModelCopyWithImpl<$Res, $Val extends UploadFilesModel>
    implements $UploadFilesModelCopyWith<$Res> {
  _$UploadFilesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? familyCard = freezed,
    Object? birthCertificate = freezed,
    Object? ktpFather = freezed,
    Object? ktpMom = freezed,
    Object? certificate = freezed,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      familyCard: freezed == familyCard
          ? _value.familyCard
          : familyCard // ignore: cast_nullable_to_non_nullable
              as String?,
      birthCertificate: freezed == birthCertificate
          ? _value.birthCertificate
          : birthCertificate // ignore: cast_nullable_to_non_nullable
              as String?,
      ktpFather: freezed == ktpFather
          ? _value.ktpFather
          : ktpFather // ignore: cast_nullable_to_non_nullable
              as String?,
      ktpMom: freezed == ktpMom
          ? _value.ktpMom
          : ktpMom // ignore: cast_nullable_to_non_nullable
              as String?,
      certificate: freezed == certificate
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadFilesModelImplCopyWith<$Res>
    implements $UploadFilesModelCopyWith<$Res> {
  factory _$$UploadFilesModelImplCopyWith(_$UploadFilesModelImpl value,
          $Res Function(_$UploadFilesModelImpl) then) =
      __$$UploadFilesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? familyCard,
      String? birthCertificate,
      String? ktpFather,
      String? ktpMom,
      String? certificate,
      String? photo});
}

/// @nodoc
class __$$UploadFilesModelImplCopyWithImpl<$Res>
    extends _$UploadFilesModelCopyWithImpl<$Res, _$UploadFilesModelImpl>
    implements _$$UploadFilesModelImplCopyWith<$Res> {
  __$$UploadFilesModelImplCopyWithImpl(_$UploadFilesModelImpl _value,
      $Res Function(_$UploadFilesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? familyCard = freezed,
    Object? birthCertificate = freezed,
    Object? ktpFather = freezed,
    Object? ktpMom = freezed,
    Object? certificate = freezed,
    Object? photo = freezed,
  }) {
    return _then(_$UploadFilesModelImpl(
      familyCard: freezed == familyCard
          ? _value.familyCard
          : familyCard // ignore: cast_nullable_to_non_nullable
              as String?,
      birthCertificate: freezed == birthCertificate
          ? _value.birthCertificate
          : birthCertificate // ignore: cast_nullable_to_non_nullable
              as String?,
      ktpFather: freezed == ktpFather
          ? _value.ktpFather
          : ktpFather // ignore: cast_nullable_to_non_nullable
              as String?,
      ktpMom: freezed == ktpMom
          ? _value.ktpMom
          : ktpMom // ignore: cast_nullable_to_non_nullable
              as String?,
      certificate: freezed == certificate
          ? _value.certificate
          : certificate // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadFilesModelImpl
    with DiagnosticableTreeMixin
    implements _UploadFilesModel {
  const _$UploadFilesModelImpl(
      {this.familyCard,
      this.birthCertificate,
      this.ktpFather,
      this.ktpMom,
      this.certificate,
      this.photo});

  factory _$UploadFilesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadFilesModelImplFromJson(json);

  @override
  final String? familyCard;
  @override
  final String? birthCertificate;
  @override
  final String? ktpFather;
  @override
  final String? ktpMom;
  @override
  final String? certificate;
  @override
  final String? photo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadFilesModel(familyCard: $familyCard, birthCertificate: $birthCertificate, ktpFather: $ktpFather, ktpMom: $ktpMom, certificate: $certificate, photo: $photo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UploadFilesModel'))
      ..add(DiagnosticsProperty('familyCard', familyCard))
      ..add(DiagnosticsProperty('birthCertificate', birthCertificate))
      ..add(DiagnosticsProperty('ktpFather', ktpFather))
      ..add(DiagnosticsProperty('ktpMom', ktpMom))
      ..add(DiagnosticsProperty('certificate', certificate))
      ..add(DiagnosticsProperty('photo', photo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadFilesModelImpl &&
            (identical(other.familyCard, familyCard) ||
                other.familyCard == familyCard) &&
            (identical(other.birthCertificate, birthCertificate) ||
                other.birthCertificate == birthCertificate) &&
            (identical(other.ktpFather, ktpFather) ||
                other.ktpFather == ktpFather) &&
            (identical(other.ktpMom, ktpMom) || other.ktpMom == ktpMom) &&
            (identical(other.certificate, certificate) ||
                other.certificate == certificate) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, familyCard, birthCertificate,
      ktpFather, ktpMom, certificate, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadFilesModelImplCopyWith<_$UploadFilesModelImpl> get copyWith =>
      __$$UploadFilesModelImplCopyWithImpl<_$UploadFilesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadFilesModelImplToJson(
      this,
    );
  }
}

abstract class _UploadFilesModel implements UploadFilesModel {
  const factory _UploadFilesModel(
      {final String? familyCard,
      final String? birthCertificate,
      final String? ktpFather,
      final String? ktpMom,
      final String? certificate,
      final String? photo}) = _$UploadFilesModelImpl;

  factory _UploadFilesModel.fromJson(Map<String, dynamic> json) =
      _$UploadFilesModelImpl.fromJson;

  @override
  String? get familyCard;
  @override
  String? get birthCertificate;
  @override
  String? get ktpFather;
  @override
  String? get ktpMom;
  @override
  String? get certificate;
  @override
  String? get photo;
  @override
  @JsonKey(ignore: true)
  _$$UploadFilesModelImplCopyWith<_$UploadFilesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
