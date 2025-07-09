import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

import 'errors.dart';
import 'failures.dart';

Either<ValueFailure<String>, String> validateTitle(
  String input,
  int maxLength,
) {
  if (input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  }
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLength(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueFailure<DateTime>, DateTime> validateDate(DateTime input) {
  if (input.isBefore(DateTime.now())) {
    return right(input);
  } else {
    return left(ValueFailure.futureDate(failedValue: input));
  }
}

Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLength<T>(
  KtList<T> input,
  int maxLength,
) {
  if (input.size <= maxLength) {
    return right(input);
  } else {
    // Simplified approach
    return left(ValueFailure.listTooLong(failedValue: input, max: maxLength));
  }
}
