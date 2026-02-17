import 'package:app/core/exceptions/domain_exception.dart';
import 'package:app/core/resources/strings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_exception.freezed.dart';

@freezed
class DataException with _$DataException {
  const factory DataException.databaseException(String message) =
      DatabaseException;

  const factory DataException.responseError(String message, int codeError) =
      ResponseError;
  const factory DataException.unexpectedError() = UnexpectedError;

  static String toMessage(DataException exception) {
    return exception.when(
      responseError: (message, code) {
        return message;
      },
      databaseException: (String message) {
        return AppStrings.errorMessages.databaseError;
      },
      unexpectedError: () => AppStrings.errorMessages.unexpectedError,
    );
  }

  static int toCode(DataException exception) {
    return exception.when(
      databaseException: (String message) {
        return 0;
      },
      responseError: (message, code) {
        return code;
      },
      unexpectedError: () => 500,
    );
  }

  static DomainException toDomainError(DataException exception) {
    return DomainException(
      exceptionType: exception,
      message: toMessage(exception),
      code: toCode(exception),
    );
  }
}
