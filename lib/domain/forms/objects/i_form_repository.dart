import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:forms_project/domain/forms/objects/form_failure.dart';
import 'package:kt_dart/collection.dart';

abstract class IFormRepository {
  // watch forms
  // C Read UD

  Stream<Either<FormFailure, KtList>> watchAll();
  Future<Either<FormFailure, Unit>> create(Form form);
  Future<Either<FormFailure, Unit>> update(Form form);
  Future<Either<FormFailure, Unit>> delete(Form form);
}