import 'package:dartz/dartz.dart';
import 'package:forms_project/domain/core/failures.dart';
import 'package:forms_project/domain/core/value_objects.dart';
import 'package:forms_project/domain/core/value_validators.dart';


class FormTitle extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 100;

  factory FormTitle(String input) {
    return
      FormTitle._(
        validateMaxStringLength(input, maxLength),
      );
  }

  const FormTitle._(this.value);
}


