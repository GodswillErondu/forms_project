import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:forms_project/domain/form/objects/form_failure.dart';
import 'package:forms_project/domain/form/objects/form_object.dart';
import 'package:forms_project/domain/form/repositories/i_form_repository.dart';
import 'package:forms_project/domain/form/objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'form_event.dart';

part 'form_state.dart';

part 'form_bloc.freezed.dart';

@injectable
class FormBloc extends Bloc<FormEvent, FormState> {
  final IFormRepository formRepository;

  FormBloc(this.formRepository) : super(FormState.initial()) {
    on<FormTextChanged>(_onFormTextChanged);
    on<FormTextSaved>(_onFormTextSaved);
    on<FormTextDeleted>(_onFormTextDeleted);
    on<FormSampleDataLoaded>(_onFormSampleDataLoaded);
    on<FormSavedTextLoaded>(_onFormSavedTextLoaded);
  }

  void _onFormTextChanged(FormTextChanged event, Emitter<FormState> emit) {
    emit(
      state.copyWith(
        title: FormTitle(event.text),
        saveFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _onFormTextSaved(
    FormTextSaved event,
    Emitter<FormState> emit,
  ) async {
    emit(state.copyWith(
        isSaving: true,
        saveFailureOrSuccessOption: none()));

    final form = FormObject.empty().copyWith(
        title: state.title.getOrCrash());

    final failureOrSuccess = await formRepository.create(form);

    emit(
      state.copyWith(
        isSaving: false,
        saveFailureOrSuccessOption: some(failureOrSuccess),
        shouldClearText: failureOrSuccess.isRight(),
        title: failureOrSuccess.fold(
          (failure) => state.title,
          (_) => FormTitle(''),
        ),
      ),
    );

    failureOrSuccess.fold(
      (failure) {},
      (_) => add(const FormEvent.formLoadSavedText()),
    );
  }

  Future<void> _onFormTextDeleted(
    FormTextDeleted event,
    Emitter<FormState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final failureOrSuccess = await formRepository.delete(event.id);

    emit(
      state.copyWith(
        isLoading: false,
        saveFailureOrSuccessOption: some(failureOrSuccess),
      ),
    );
  }

  Future<void> _onFormSampleDataLoaded(
    FormSampleDataLoaded event,
    Emitter<FormState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final failureOrSuccess = await formRepository.loadSampleData();

    emit(
      state.copyWith(
        isLoading: false,
        saveFailureOrSuccessOption: some(failureOrSuccess),
      ),
    );

    failureOrSuccess.fold(
      (failure) {},
      (_) => add(const FormEvent.formLoadSavedText()),
    );
  }

  Future<void> _onFormSavedTextLoaded(
    FormSavedTextLoaded event,
    Emitter<FormState> emit,
  ) async {
    emit(state.copyWith(
        isLoading: true,));

    final failureOrForms = await formRepository.getSavedForms();

    emit(
      failureOrForms.fold(
        (failure) => state.copyWith(
          isLoading: false,
          saveFailureOrSuccessOption: some(left(failure)),
        ),
        (forms) => state.copyWith(
          isLoading: false,
          saveFailureOrSuccessOption: some(right(unit)),
        ),
      ),
    );
  }
}
