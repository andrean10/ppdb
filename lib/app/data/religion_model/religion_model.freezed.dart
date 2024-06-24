// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'religion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReligionModel _$ReligionModelFromJson(Map<String, dynamic> json) {
  return _ReligionModel.fromJson(json);
}

/// @nodoc
mixin _$ReligionModel {
  String? get uid => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReligionModelCopyWith<ReligionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReligionModelCopyWith<$Res> {
  factory $ReligionModelCopyWith(
          ReligionModel value, $Res Function(ReligionModel) then) =
      _$ReligionModelCopyWithImpl<$Res, ReligionModel>;
  @useResult
  $Res call({String? uid, String? title});
}

/// @nodoc
class _$ReligionModelCopyWithImpl<$Res, $Val extends ReligionModel>
    implements $ReligionModelCopyWith<$Res> {
  _$ReligionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReligionModelImplCopyWith<$Res>
    implements $ReligionModelCopyWith<$Res> {
  factory _$$ReligionModelImplCopyWith(
          _$ReligionModelImpl value, $Res Function(_$ReligionModelImpl) then) =
      __$$ReligionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uid, String? title});
}

/// @nodoc
class __$$ReligionModelImplCopyWithImpl<$Res>
    extends _$ReligionModelCopyWithImpl<$Res, _$ReligionModelImpl>
    implements _$$ReligionModelImplCopyWith<$Res> {
  __$$ReligionModelImplCopyWithImpl(
      _$ReligionModelImpl _value, $Res Function(_$ReligionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? title = freezed,
  }) {
    return _then(_$ReligionModelImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReligionModelImpl
    with DiagnosticableTreeMixin
    implements _ReligionModel {
  const _$ReligionModelImpl({required this.uid, required this.title});

  factory _$ReligionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReligionModelImplFromJson(json);

  @override
  final String? uid;
  @override
  final String? title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReligionModel(uid: $uid, title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReligionModel'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReligionModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReligionModelImplCopyWith<_$ReligionModelImpl> get copyWith =>
      __$$ReligionModelImplCopyWithImpl<_$ReligionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReligionModelImplToJson(
      this,
    );
  }
}

abstract class _ReligionModel implements ReligionModel {
  const factory _ReligionModel(
      {required final String? uid,
      required final String? title}) = _$ReligionModelImpl;

  factory _ReligionModel.fromJson(Map<String, dynamic> json) =
      _$ReligionModelImpl.fromJson;

  @override
  String? get uid;
  @override
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$ReligionModelImplCopyWith<_$ReligionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
