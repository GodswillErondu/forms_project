import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_event.dart';
part 'form_state.dart';
part 'form_bloc.freezed.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(const FormState.initial()) {
    on<FormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
