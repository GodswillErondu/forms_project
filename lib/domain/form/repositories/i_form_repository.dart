import 'package:dartz/dartz.dart';


import '../objects/form_failure.dart';
import '../objects/form_object.dart';

abstract class IFormRepository {
  Future<Either<FormFailure, Unit>> create(FormObject form); //put in box
  Future<Either<FormFailure, Unit>> update(FormObject form); //manipulate data in box
  Future<Either<FormFailure, Unit>> delete(String id); //remove from box
  Future<Either<FormFailure, Unit>> loadSampleData(); // load data from Json
  Future<Either<FormFailure, List<FormObject>>> getSavedForms();// get a list of saved forms
}




