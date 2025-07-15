import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:forms_project/domain/forms/objects/form_failure.dart';
import 'package:forms_project/domain/forms/objects/form_object.dart';
import 'package:forms_project/domain/forms/objects/i_form_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_event.dart';
part 'form_state.dart';
part 'form_bloc.freezed.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  final IFormRepository formRepository;

  FormBloc({required this.formRepository}) : super(const FormState.initial()) {
    on<_FormCreateRequested>(_onCreateRequested);
    on<_FormUpdateRequested>(_onUpdateRequested);
    on<_FormDeleteRequested>(_onDeleteRequested);
  }

  Future<void> _onCreateRequested(_FormCreateRequested event,
      Emitter<FormState> emit,) async {
    emit(const FormState.actionInProgress());

    try {
      final result = await formRepository.create(event.form);

      if (!emit.isDone) {
        emit(_handleOperationResult(result, 'Form created successfully'));
      }
    } catch (e) {
      if (!emit.isDone) {
        emit(FormState.failure(FormFailure.unexpected()));
      }
    }
  }

  Future<void> _onUpdateRequested(_FormUpdateRequested event,
      Emitter<FormState> emit,) async {
    emit(const FormState.actionInProgress());

    try {
      final result = await formRepository.update(event.form);

      if (!emit.isDone) {
        emit(_handleOperationResult(result, 'Form updated successfully'));
      }
    } catch (e) {
      if (!emit.isDone) {
        emit(FormState.failure(FormFailure.unexpected()));
      }
    }
  }

  Future<void> _onDeleteRequested(_FormDeleteRequested event,
      Emitter<FormState> emit,) async {
    emit(const FormState.actionInProgress());

    try {
      final result = await formRepository.delete(event.form);

      if (!emit.isDone) {
        emit(_handleOperationResult(result, 'Form deleted successfully'));
      }
    } catch (e) {
      if (!emit.isDone) {
        emit(FormState.failure(FormFailure.unexpected()));
      }
    }
  }

  FormState _handleOperationResult(Either<FormFailure, Unit> result,
      String successMessage,) {
    return result.fold(
          (failure) => FormState.failure(failure),
          (_) => FormState.success('successful'),
    );
  }

}
