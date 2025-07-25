part of 'form_bloc.dart';

@freezed
abstract class FormEvent with _$FormEvent {
  const factory FormEvent.formTextChanged(String text) = FormTextChanged;
  const factory FormEvent.formTextSaved() = FormTextSaved;
  const factory FormEvent.formTextDeleted(String id) = FormTextDeleted;
  const factory FormEvent.formSampleDataLoaded() = FormSampleDataLoaded;
  const factory FormEvent.formLoadSavedText() = FormSavedTextLoaded;
}
