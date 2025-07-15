import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:dartz/dartz.dart';
import 'package:forms_project/domain/forms/objects/form_failure.dart';
import 'package:forms_project/domain/forms/objects/form_object.dart';
import 'package:forms_project/domain/forms/objects/i_form_repository.dart';
import 'package:hive/hive.dart';

import 'dtos/form_dto.dart';


class FormRepository implements IFormRepository {
  final Box<FormDto> formBox;
  bool _seeded = false;
  bool _seedingInProgress = false;

  FormRepository(this.formBox);
  
  Future<void> _seedFromJsonIfEmpty() async {
    if (_seedingInProgress) return;
    if (!_seeded && formBox.isEmpty) {
      try {
        _seedingInProgress = true;
        final jsonString = await rootBundle.loadString('assets/form_sample.json');
        final List decoded = json.decode(jsonString);
        await Future.wait(
          decoded.map((formMap) async {
            final dto = FormDto.fromJson(formMap);
            await formBox.put(dto.id, dto);
          }),
        );
      } catch (e) {
        print('Seeding failed: $e');
      } finally {
        _seeded = true;
        _seedingInProgress = false;
      }
    }
  }

  @override
  Future<Either<FormFailure, Unit>> create(FormObject formObject) async {
    try {
      await _seedFromJsonIfEmpty();
      final dto = FormDto.fromDomain(formObject); // Now using FormObject
      await formBox.put(dto.id, dto);
      return right(unit);
    } on HiveError catch (e) {
      return left(FormFailure.databaseFailure(e));
    } catch (e) {
      return left(const FormFailure.unexpected());
    }
  }

  @override
  Future<Either<FormFailure, Unit>> update(FormObject formObject) async {
    try {
      if (!formBox.containsKey(formObject.id)) {
        return left(FormFailure.notFound());
      }
      final dto = FormDto.fromDomain(formObject);
      await formBox.put(dto.id, dto);
      return right(unit);
    } on HiveError catch (e) {
      return left(FormFailure.databaseFailure(e));
    } catch (e) {
      return left(const FormFailure.unexpected());
    }
  }

  @override
  Future<Either<FormFailure, Unit>> delete(FormObject id) async {
   try {
     if (!formBox.containsKey(id)) {
       return left(FormFailure.notFound());
     }

     await formBox.delete(id);
     return right(unit);
   } on HiveError catch (e) {
     return left(FormFailure.databaseFailure(e));
   } catch (e) {
     return left(const FormFailure.unexpected());
   }
  }

}



