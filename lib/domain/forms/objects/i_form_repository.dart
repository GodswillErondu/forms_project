import 'package:dartz/dartz.dart';
import 'package:forms_project/domain/forms/objects/form_failure.dart';
import 'package:forms_project/domain/forms/objects/form_object.dart';

abstract class IFormRepository {
  // watch forms
  // C Read UD

  Future<Either<FormFailure, Unit>> create(FormObject form);
  Future<Either<FormFailure, Unit>> update(FormObject form);
  Future<Either<FormFailure, Unit>> delete(FormObject form);
}