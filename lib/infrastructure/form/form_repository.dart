import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:dartz/dartz.dart';
import 'package:forms_project/domain/form/objects/form_failure.dart';
import 'package:forms_project/domain/form/objects/form_object.dart';
import 'package:forms_project/domain/form/repositories/i_form_repository.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'dtos/form_dto.dart';

@LazySingleton(as: IFormRepository)
class FormRepository implements IFormRepository {
  final Box<FormDto> formBox;

  FormRepository(this.formBox);

  Future<void> seedIfEmpty() async {
    if (formBox.isEmpty) {
      await loadSampleData();
    }
  }

  @override
  Future<Either<FormFailure, Unit>> loadSampleData() async {
    try {
      final String jsonString = await rootBundle.loadString(
          'assets/form_sample.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      // check for text or form
      // final List<dynamic> texts = jsonData['texts'];
      //
      // for (final textData in texts) {
      //   final dto = FormDto.fromJson(Map<String, dynamic>.from(textData));
      //   await formBox.put(dto.id, dto);
      // }

      final dto = FormDto.fromJson(jsonData);
      await formBox.put(dto.id, dto);

      return right(unit);
    } catch (e) {
      print("Seeding error: $e");
      return left(const FormFailure.unexpected());
    }
  }


  @override
  Future<Either<FormFailure, Unit>> create(FormObject form) async {
    try {
      await seedIfEmpty();
      final dto = FormDto.fromDomain(form);
      await formBox.put(dto.id, dto);
      return right(unit);
    } catch (_) {
      return left(const FormFailure.unexpected());
    }
  }


  @override
  Future<Either<FormFailure, Unit>> update(FormObject form) async {
    try {
      if (!formBox.containsKey(form.id)) {
        return left(FormFailure.notFound());
      }
      final dto = FormDto.fromDomain(form);
      await formBox.put(dto.id, dto);
      return right(unit);
    } catch (_) {
      return left(const FormFailure.unableToUpdate());
    }
  }

  @override
  Future<Either<FormFailure, Unit>> delete(String id) async {
    try {
      if (!formBox.containsKey(id)) {
        return left(FormFailure.notFound());
      }
      await formBox.delete(id);
      return right(unit);
    } catch (e) {
      print('Delete error: $e');
      return left(const FormFailure.unexpected());
    }
  }

  @override
  Future<Either<FormFailure, List<FormObject>>> getSavedForms() async {
    try {
      await seedIfEmpty(); // Ensure we have data
      final forms = formBox.values.map((dto) => dto.toDomain()).toList();
      return right(forms);
    } catch (e) {
      print('Error loading saved forms: $e');
      return left(const FormFailure.unexpected());
    }
  }
}





