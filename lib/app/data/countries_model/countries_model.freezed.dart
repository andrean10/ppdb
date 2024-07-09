// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'countries_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountriesModel _$CountriesModelFromJson(Map<String, dynamic> json) {
  return _CountriesModel.fromJson(json);
}

/// @nodoc
mixin _$CountriesModel {
  String? get name => throw _privateConstructorUsedError;
  String? get unicodeFlag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountriesModelCopyWith<CountriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountriesModelCopyWith<$Res> {
  factory $CountriesModelCopyWith(
          CountriesModel value, $Res Function(CountriesModel) then) =
      _$CountriesModelCopyWithImpl<$Res, CountriesModel>;
  @useResult
  $Res call({String? name, String? unicodeFlag});
}

/// @nodoc
class _$CountriesModelCopyWithImpl<$Res, $Val extends CountriesModel>
    implements $CountriesModelCopyWith<$Res> {
  _$CountriesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? unicodeFlag = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      unicodeFlag: freezed == unicodeFlag
          ? _value.unicodeFlag
          : unicodeFlag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountriesModelImplCopyWith<$Res>
    implements $CountriesModelCopyWith<$Res> {
  factory _$$CountriesModelImplCopyWith(_$CountriesModelImpl value,
          $Res Function(_$CountriesModelImpl) then) =
      __$$CountriesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? unicodeFlag});
}

/// @nodoc
class __$$CountriesModelImplCopyWithImpl<$Res>
    extends _$CountriesModelCopyWithImpl<$Res, _$CountriesModelImpl>
    implements _$$CountriesModelImplCopyWith<$Res> {
  __$$CountriesModelImplCopyWithImpl(
      _$CountriesModelImpl _value, $Res Function(_$CountriesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? unicodeFlag = freezed,
  }) {
    return _then(_$CountriesModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      unicodeFlag: freezed == unicodeFlag
          ? _value.unicodeFlag
          : unicodeFlag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountriesModelImpl
    with DiagnosticableTreeMixin
    implements _CountriesModel {
  const _$CountriesModelImpl({required this.name, required this.unicodeFlag});

  factory _$CountriesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountriesModelImplFromJson(json);

  @override
  final String? name;
  @override
  final String? unicodeFlag;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CountriesModel(name: $name, unicodeFlag: $unicodeFlag)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CountriesModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('unicodeFlag', unicodeFlag));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountriesModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unicodeFlag, unicodeFlag) ||
                other.unicodeFlag == unicodeFlag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, unicodeFlag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountriesModelImplCopyWith<_$CountriesModelImpl> get copyWith =>
      __$$CountriesModelImplCopyWithImpl<_$CountriesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountriesModelImplToJson(
      this,
    );
  }
}

abstract class _CountriesModel implements CountriesModel {
  const factory _CountriesModel(
      {required final String? name,
      required final String? unicodeFlag}) = _$CountriesModelImpl;

  factory _CountriesModel.fromJson(Map<String, dynamic> json) =
      _$CountriesModelImpl.fromJson;

  @override
  String? get name;
  @override
  String? get unicodeFlag;
  @override
  @JsonKey(ignore: true)
  _$$CountriesModelImplCopyWith<_$CountriesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
