import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.empty({
    required T failedValue}) = Empty<T>;

  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;

  const factory ValueFailure.futureDate({required T failedValue}) =
      FutureDate<T>;

  const factory ValueFailure.invalidDate({required T failedValue}) =
      InvalidDate<T>;

  const factory ValueFailure.listTooLong({
    required KtList failedValue,
    required int max,
  }) = ListTooLong;
}
