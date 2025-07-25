part of 'form_bloc.dart';

@freezed
abstract class FormState with _$FormState {
  const factory FormState({
    required FormTitle title,
    required List<FormObject> forms,
    required bool isLoading,
    required bool isSaving,
    required bool shouldClearText,
    required Option<Either<FormFailure, Unit>> saveFailureOrSuccessOption,
  }) = _FormState;

  factory FormState.initial() => FormState(
    title: FormTitle(''),
    forms: [],
    isLoading: false,
    isSaving: false,
    shouldClearText: false,
    saveFailureOrSuccessOption: none(),
  );
}
