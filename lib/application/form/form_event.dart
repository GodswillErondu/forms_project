part of 'form_bloc.dart';

@freezed
abstract class FormEvent with _$FormEvent {
  const factory FormEvent.createRequested(FormObject form) = _FormCreateRequested;
  const factory FormEvent.updateRequested(FormObject form) = _FormUpdateRequested;
  const factory FormEvent.deleteRequested(FormObject form) = _FormDeleteRequested;
  const factory FormEvent.loadRequested(FormObject form) = _FormLoadRequested;
}
