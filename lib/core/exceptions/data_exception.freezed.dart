// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) databaseException,
    required TResult Function(String message, int codeError) responseError,
    required TResult Function() unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? databaseException,
    TResult? Function(String message, int codeError)? responseError,
    TResult? Function()? unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? databaseException,
    TResult Function(String message, int codeError)? responseError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseException value) databaseException,
    required TResult Function(ResponseError value) responseError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseException value)? databaseException,
    TResult? Function(ResponseError value)? responseError,
    TResult? Function(UnexpectedError value)? unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseException value)? databaseException,
    TResult Function(ResponseError value)? responseError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataExceptionCopyWith<$Res> {
  factory $DataExceptionCopyWith(
          DataException value, $Res Function(DataException) then) =
      _$DataExceptionCopyWithImpl<$Res, DataException>;
}

/// @nodoc
class _$DataExceptionCopyWithImpl<$Res, $Val extends DataException>
    implements $DataExceptionCopyWith<$Res> {
  _$DataExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DatabaseExceptionImplCopyWith<$Res> {
  factory _$$DatabaseExceptionImplCopyWith(_$DatabaseExceptionImpl value,
          $Res Function(_$DatabaseExceptionImpl) then) =
      __$$DatabaseExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DatabaseExceptionImplCopyWithImpl<$Res>
    extends _$DataExceptionCopyWithImpl<$Res, _$DatabaseExceptionImpl>
    implements _$$DatabaseExceptionImplCopyWith<$Res> {
  __$$DatabaseExceptionImplCopyWithImpl(_$DatabaseExceptionImpl _value,
      $Res Function(_$DatabaseExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DatabaseExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DatabaseExceptionImpl implements DatabaseException {
  const _$DatabaseExceptionImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DataException.databaseException(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseExceptionImplCopyWith<_$DatabaseExceptionImpl> get copyWith =>
      __$$DatabaseExceptionImplCopyWithImpl<_$DatabaseExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) databaseException,
    required TResult Function(String message, int codeError) responseError,
    required TResult Function() unexpectedError,
  }) {
    return databaseException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? databaseException,
    TResult? Function(String message, int codeError)? responseError,
    TResult? Function()? unexpectedError,
  }) {
    return databaseException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? databaseException,
    TResult Function(String message, int codeError)? responseError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (databaseException != null) {
      return databaseException(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseException value) databaseException,
    required TResult Function(ResponseError value) responseError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return databaseException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseException value)? databaseException,
    TResult? Function(ResponseError value)? responseError,
    TResult? Function(UnexpectedError value)? unexpectedError,
  }) {
    return databaseException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseException value)? databaseException,
    TResult Function(ResponseError value)? responseError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (databaseException != null) {
      return databaseException(this);
    }
    return orElse();
  }
}

abstract class DatabaseException implements DataException {
  const factory DatabaseException(final String message) =
      _$DatabaseExceptionImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$DatabaseExceptionImplCopyWith<_$DatabaseExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResponseErrorImplCopyWith<$Res> {
  factory _$$ResponseErrorImplCopyWith(
          _$ResponseErrorImpl value, $Res Function(_$ResponseErrorImpl) then) =
      __$$ResponseErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, int codeError});
}

/// @nodoc
class __$$ResponseErrorImplCopyWithImpl<$Res>
    extends _$DataExceptionCopyWithImpl<$Res, _$ResponseErrorImpl>
    implements _$$ResponseErrorImplCopyWith<$Res> {
  __$$ResponseErrorImplCopyWithImpl(
      _$ResponseErrorImpl _value, $Res Function(_$ResponseErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? codeError = null,
  }) {
    return _then(_$ResponseErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == codeError
          ? _value.codeError
          : codeError // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ResponseErrorImpl implements ResponseError {
  const _$ResponseErrorImpl(this.message, this.codeError);

  @override
  final String message;
  @override
  final int codeError;

  @override
  String toString() {
    return 'DataException.responseError(message: $message, codeError: $codeError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.codeError, codeError) ||
                other.codeError == codeError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, codeError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseErrorImplCopyWith<_$ResponseErrorImpl> get copyWith =>
      __$$ResponseErrorImplCopyWithImpl<_$ResponseErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) databaseException,
    required TResult Function(String message, int codeError) responseError,
    required TResult Function() unexpectedError,
  }) {
    return responseError(message, codeError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? databaseException,
    TResult? Function(String message, int codeError)? responseError,
    TResult? Function()? unexpectedError,
  }) {
    return responseError?.call(message, codeError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? databaseException,
    TResult Function(String message, int codeError)? responseError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (responseError != null) {
      return responseError(message, codeError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseException value) databaseException,
    required TResult Function(ResponseError value) responseError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return responseError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseException value)? databaseException,
    TResult? Function(ResponseError value)? responseError,
    TResult? Function(UnexpectedError value)? unexpectedError,
  }) {
    return responseError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseException value)? databaseException,
    TResult Function(ResponseError value)? responseError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (responseError != null) {
      return responseError(this);
    }
    return orElse();
  }
}

abstract class ResponseError implements DataException {
  const factory ResponseError(final String message, final int codeError) =
      _$ResponseErrorImpl;

  String get message;
  int get codeError;
  @JsonKey(ignore: true)
  _$$ResponseErrorImplCopyWith<_$ResponseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedErrorImplCopyWith<$Res> {
  factory _$$UnexpectedErrorImplCopyWith(_$UnexpectedErrorImpl value,
          $Res Function(_$UnexpectedErrorImpl) then) =
      __$$UnexpectedErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnexpectedErrorImplCopyWithImpl<$Res>
    extends _$DataExceptionCopyWithImpl<$Res, _$UnexpectedErrorImpl>
    implements _$$UnexpectedErrorImplCopyWith<$Res> {
  __$$UnexpectedErrorImplCopyWithImpl(
      _$UnexpectedErrorImpl _value, $Res Function(_$UnexpectedErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnexpectedErrorImpl implements UnexpectedError {
  const _$UnexpectedErrorImpl();

  @override
  String toString() {
    return 'DataException.unexpectedError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnexpectedErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) databaseException,
    required TResult Function(String message, int codeError) responseError,
    required TResult Function() unexpectedError,
  }) {
    return unexpectedError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? databaseException,
    TResult? Function(String message, int codeError)? responseError,
    TResult? Function()? unexpectedError,
  }) {
    return unexpectedError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? databaseException,
    TResult Function(String message, int codeError)? responseError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseException value) databaseException,
    required TResult Function(ResponseError value) responseError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return unexpectedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseException value)? databaseException,
    TResult? Function(ResponseError value)? responseError,
    TResult? Function(UnexpectedError value)? unexpectedError,
  }) {
    return unexpectedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseException value)? databaseException,
    TResult Function(ResponseError value)? responseError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(this);
    }
    return orElse();
  }
}

abstract class UnexpectedError implements DataException {
  const factory UnexpectedError() = _$UnexpectedErrorImpl;
}
