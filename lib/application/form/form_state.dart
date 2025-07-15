part of 'form_bloc.dart';

@freezed
abstract class FormState with _$FormState {
  const factory FormState.initial() = _Initial;
  const factory FormState.actionInProgress() = _FormActionInProgress;
  const factory FormState.failure(FormFailure failure) = _FormFailure;
  const factory FormState.success(String message) = _SuccessMessage;
}


