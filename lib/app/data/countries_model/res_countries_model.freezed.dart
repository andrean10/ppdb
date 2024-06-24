// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_countries_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResCountriesModel _$ResCountriesModelFromJson(Map<String, dynamic> json) {
  return _ResCountriesModel.fromJson(json);
}

/// @nodoc
mixin _$ResCountriesModel {
  bool? get error => throw _privateConstructorUsedError;
  String? get msg => throw _privateConstructorUsedError;
  List<CountriesModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResCountriesModelCopyWith<ResCountriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResCountriesModelCopyWith<$Res> {
  factory $ResCountriesModelCopyWith(
          ResCountriesModel value, $Res Function(ResCountriesModel) then) =
      _$ResCountriesModelCopyWithImpl<$Res, ResCountriesModel>;
  @useResult
  $Res call({bool? error, String? msg, List<CountriesModel>? data});
}

/// @nodoc
class _$ResCountriesModelCopyWithImpl<$Res, $Val extends ResCountriesModel>
    implements $ResCountriesModelCopyWith<$Res> {
  _$ResCountriesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? msg = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CountriesModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResCountriesModelImplCopyWith<$Res>
    implements $ResCountriesModelCopyWith<$Res> {
  factory _$$ResCountriesModelImplCopyWith(_$ResCountriesModelImpl value,
          $Res Function(_$ResCountriesModelImpl) then) =
      __$$ResCountriesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? error, String? msg, List<CountriesModel>? data});
}

/// @nodoc
class __$$ResCountriesModelImplCopyWithImpl<$Res>
    extends _$ResCountriesModelCopyWithImpl<$Res, _$ResCountriesModelImpl>
    implements _$$ResCountriesModelImplCopyWith<$Res> {
  __$$ResCountriesModelImplCopyWithImpl(_$ResCountriesModelImpl _value,
      $Res Function(_$ResCountriesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? msg = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ResCountriesModelImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CountriesModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResCountriesModelImpl
    with DiagnosticableTreeMixin
    implements _ResCountriesModel {
  const _$ResCountriesModelImpl(
      {required this.error,
      required this.msg,
      required final List<CountriesModel>? data})
      : _data = data;

  factory _$ResCountriesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResCountriesModelImplFromJson(json);

  @override
  final bool? error;
  @override
  final String? msg;
  final List<CountriesModel>? _data;
  @override
  List<CountriesModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResCountriesModel(error: $error, msg: $msg, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResCountriesModel'))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('msg', msg))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResCountriesModelImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, error, msg, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResCountriesModelImplCopyWith<_$ResCountriesModelImpl> get copyWith =>
      __$$ResCountriesModelImplCopyWithImpl<_$ResCountriesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResCountriesModelImplToJson(
      this,
    );
  }
}

abstract class _ResCountriesModel implements ResCountriesModel {
  const factory _ResCountriesModel(
      {required final bool? error,
      required final String? msg,
      required final List<CountriesModel>? data}) = _$ResCountriesModelImpl;

  factory _ResCountriesModel.fromJson(Map<String, dynamic> json) =
      _$ResCountriesModelImpl.fromJson;

  @override
  bool? get error;
  @override
  String? get msg;
  @override
  List<CountriesModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$ResCountriesModelImplCopyWith<_$ResCountriesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
