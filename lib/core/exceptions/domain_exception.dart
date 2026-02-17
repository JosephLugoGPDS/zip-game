import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app/core/exceptions/data_exception.dart';

part 'domain_exception.freezed.dart';

@freezed
class DomainException with _$DomainException {
  const factory DomainException({
    @Default('') String message,
    @Default(0) int code,
    required DataException exceptionType,
  }) = _DomainException;
}
