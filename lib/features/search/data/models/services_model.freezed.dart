// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'services_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServicesModel _$ServicesModelFromJson(Map<String, dynamic> json) {
  return _ServicesModel.fromJson(json);
}

/// @nodoc
mixin _$ServicesModel {
  String get title => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get pathName => throw _privateConstructorUsedError;
  String get group => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServicesModelCopyWith<ServicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesModelCopyWith<$Res> {
  factory $ServicesModelCopyWith(
          ServicesModel value, $Res Function(ServicesModel) then) =
      _$ServicesModelCopyWithImpl<$Res, ServicesModel>;
  @useResult
  $Res call({String title, String icon, String pathName, String group});
}

/// @nodoc
class _$ServicesModelCopyWithImpl<$Res, $Val extends ServicesModel>
    implements $ServicesModelCopyWith<$Res> {
  _$ServicesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? icon = null,
    Object? pathName = null,
    Object? group = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      pathName: null == pathName
          ? _value.pathName
          : pathName // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServicesModelImplCopyWith<$Res>
    implements $ServicesModelCopyWith<$Res> {
  factory _$$ServicesModelImplCopyWith(
          _$ServicesModelImpl value, $Res Function(_$ServicesModelImpl) then) =
      __$$ServicesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String icon, String pathName, String group});
}

/// @nodoc
class __$$ServicesModelImplCopyWithImpl<$Res>
    extends _$ServicesModelCopyWithImpl<$Res, _$ServicesModelImpl>
    implements _$$ServicesModelImplCopyWith<$Res> {
  __$$ServicesModelImplCopyWithImpl(
      _$ServicesModelImpl _value, $Res Function(_$ServicesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? icon = null,
    Object? pathName = null,
    Object? group = null,
  }) {
    return _then(_$ServicesModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      pathName: null == pathName
          ? _value.pathName
          : pathName // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServicesModelImpl implements _ServicesModel {
  const _$ServicesModelImpl(
      {required this.title,
      required this.icon,
      required this.pathName,
      required this.group});

  factory _$ServicesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServicesModelImplFromJson(json);

  @override
  final String title;
  @override
  final String icon;
  @override
  final String pathName;
  @override
  final String group;

  @override
  String toString() {
    return 'ServicesModel(title: $title, icon: $icon, pathName: $pathName, group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicesModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.pathName, pathName) ||
                other.pathName == pathName) &&
            (identical(other.group, group) || other.group == group));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, icon, pathName, group);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicesModelImplCopyWith<_$ServicesModelImpl> get copyWith =>
      __$$ServicesModelImplCopyWithImpl<_$ServicesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServicesModelImplToJson(
      this,
    );
  }
}

abstract class _ServicesModel implements ServicesModel {
  const factory _ServicesModel(
      {required final String title,
      required final String icon,
      required final String pathName,
      required final String group}) = _$ServicesModelImpl;

  factory _ServicesModel.fromJson(Map<String, dynamic> json) =
      _$ServicesModelImpl.fromJson;

  @override
  String get title;
  @override
  String get icon;
  @override
  String get pathName;
  @override
  String get group;
  @override
  @JsonKey(ignore: true)
  _$$ServicesModelImplCopyWith<_$ServicesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
