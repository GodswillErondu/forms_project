import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_failure.freezed.dart';

/// tells us what went wrong in the backend

@freezed
abstract class FormFailure with _$FormFailure{
  const factory FormFailure.unexpected() = _Unexpected;
}