

import 'package:dartz/dartz.dart';
import 'package:forms_project/domain/core/failures.dart';

abstract class ValueObject<T> {
  const ValueObject();
  Either<Failure<T>, T> get value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';

}