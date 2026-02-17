import 'package:app/core/api/api_result.dart';
import 'package:app/core/exceptions/data_exception.dart';

extension ApiResultExtension<T> on ApiResult<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get data => maybeWhen(
        success: (data) => data,
        orElse: () => null,
      );

  DataException? get dataException => maybeWhen(
        failure: (e) => e,
        orElse: () => null,
      );
}
