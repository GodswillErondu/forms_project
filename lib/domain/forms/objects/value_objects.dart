import 'package:dartz/dartz.dart';
import 'package:forms_project/domain/core/failures.dart';
import 'package:forms_project/domain/core/value_objects.dart';
import 'package:forms_project/domain/core/value_validators.dart';
import 'package:kt_dart/collection.dart';

class FormTitle extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 100;

  factory FormTitle(String input) {
    return FormTitle._(
      validateTitle(input, maxLength),
    );
  }

  const FormTitle._(this.value);
}

class FormDate extends ValueObject<DateTime> {
  @override
  final Either<ValueFailure<DateTime>, DateTime> value;

  factory FormDate(DateTime input) {
    return FormDate._(
      validateDate(input),
    );
  }

  factory FormDate.now() => FormDate(DateTime.now());

  const FormDate._(this.value);
}

class List10<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 10;

  factory List10(KtList<T> input) {
    return List10._(
      validateMaxListLength(input, maxLength),
    );
  }

  const List10._(this.value);
}
