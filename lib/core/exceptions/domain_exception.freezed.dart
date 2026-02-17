// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domain_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DomainException {
  String get message => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  DataException get exceptionType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DomainExceptionCopyWith<DomainException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainExceptionCopyWith<$Res> {
  factory $DomainExceptionCopyWith(
          DomainException value, $Res Function(DomainException) then) =
      _$DomainExceptionCopyWithImpl<$Res, DomainException>;
  @useResult
  $Res call({String message, int code, DataException exceptionType});

  $DataExceptionCopyWith<$Res> get exceptionType;
}

/// @nodoc
class _$DomainExceptionCopyWithImpl<$Res, $Val extends DomainException>
    implements $DomainExceptionCopyWith<$Res> {
  _$DomainExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? exceptionType = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      exceptionType: null == exceptionType
          ? _value.exceptionType
          : exceptionType // ignore: cast_nullable_to_non_nullable
              as DataException,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataExceptionCopyWith<$Res> get exceptionType {
    return $DataExceptionCopyWith<$Res>(_value.exceptionType, (value) {
      return _then(_value.copyWith(exceptionType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DomainExceptionImplCopyWith<$Res>
    implements $DomainExceptionCopyWith<$Res> {
  factory _$$DomainExceptionImplCopyWith(_$DomainExceptionImpl value,
          $Res Function(_$DomainExceptionImpl) then) =
      __$$DomainExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int code, DataException exceptionType});

  @override
  $DataExceptionCopyWith<$Res> get exceptionType;
}

/// @nodoc
class __$$DomainExceptionImplCopyWithImpl<$Res>
    extends _$DomainExceptionCopyWithImpl<$Res, _$DomainExceptionImpl>
    implements _$$DomainExceptionImplCopyWith<$Res> {
  __$$DomainExceptionImplCopyWithImpl(
      _$DomainExceptionImpl _value, $Res Function(_$DomainExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? exceptionType = null,
  }) {
    return _then(_$DomainExceptionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      exceptionType: null == exceptionType
          ? _value.exceptionType
          : exceptionType // ignore: cast_nullable_to_non_nullable
              as DataException,
    ));
  }
}

/// @nodoc

class _$DomainExceptionImpl implements _DomainException {
  const _$DomainExceptionImpl(
      {this.message = '', this.code = 0, required this.exceptionType});

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final int code;
  @override
  final DataException exceptionType;

  @override
  String toString() {
    return 'DomainException(message: $message, code: $code, exceptionType: $exceptionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.exceptionType, exceptionType) ||
                other.exceptionType == exceptionType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code, exceptionType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainExceptionImplCopyWith<_$DomainExceptionImpl> get copyWith =>
      __$$DomainExceptionImplCopyWithImpl<_$DomainExceptionImpl>(
          this, _$identity);
}

abstract class _DomainException implements DomainException {
  const factory _DomainException(
      {final String message,
      final int code,
      required final DataException exceptionType}) = _$DomainExceptionImpl;

  @override
  String get message;
  @override
  int get code;
  @override
  DataException get exceptionType;
  @override
  @JsonKey(ignore: true)
  _$$DomainExceptionImplCopyWith<_$DomainExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
