// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'special_needs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpecialNeedsModel _$SpecialNeedsModelFromJson(Map<String, dynamic> json) {
  return _SpecialNeedsModel.fromJson(json);
}

/// @nodoc
mixin _$SpecialNeedsModel {
  String? get title => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecialNeedsModelCopyWith<SpecialNeedsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialNeedsModelCopyWith<$Res> {
  factory $SpecialNeedsModelCopyWith(
          SpecialNeedsModel value, $Res Function(SpecialNeedsModel) then) =
      _$SpecialNeedsModelCopyWithImpl<$Res, SpecialNeedsModel>;
  @useResult
  $Res call({String? title, String? category});
}

/// @nodoc
class _$SpecialNeedsModelCopyWithImpl<$Res, $Val extends SpecialNeedsModel>
    implements $SpecialNeedsModelCopyWith<$Res> {
  _$SpecialNeedsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecialNeedsModelImplCopyWith<$Res>
    implements $SpecialNeedsModelCopyWith<$Res> {
  factory _$$SpecialNeedsModelImplCopyWith(_$SpecialNeedsModelImpl value,
          $Res Function(_$SpecialNeedsModelImpl) then) =
      __$$SpecialNeedsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? category});
}

/// @nodoc
class __$$SpecialNeedsModelImplCopyWithImpl<$Res>
    extends _$SpecialNeedsModelCopyWithImpl<$Res, _$SpecialNeedsModelImpl>
    implements _$$SpecialNeedsModelImplCopyWith<$Res> {
  __$$SpecialNeedsModelImplCopyWithImpl(_$SpecialNeedsModelImpl _value,
      $Res Function(_$SpecialNeedsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? category = freezed,
  }) {
    return _then(_$SpecialNeedsModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecialNeedsModelImpl
    with DiagnosticableTreeMixin
    implements _SpecialNeedsModel {
  const _$SpecialNeedsModelImpl({this.title, this.category});

  factory _$SpecialNeedsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialNeedsModelImplFromJson(json);

  @override
  final String? title;
  @override
  final String? category;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SpecialNeedsModel(title: $title, category: $category)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SpecialNeedsModel'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('category', category));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialNeedsModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialNeedsModelImplCopyWith<_$SpecialNeedsModelImpl> get copyWith =>
      __$$SpecialNeedsModelImplCopyWithImpl<_$SpecialNeedsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecialNeedsModelImplToJson(
      this,
    );
  }
}

abstract class _SpecialNeedsModel implements SpecialNeedsModel {
  const factory _SpecialNeedsModel(
      {final String? title, final String? category}) = _$SpecialNeedsModelImpl;

  factory _SpecialNeedsModel.fromJson(Map<String, dynamic> json) =
      _$SpecialNeedsModelImpl.fromJson;

  @override
  String? get title;
  @override
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$$SpecialNeedsModelImplCopyWith<_$SpecialNeedsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
