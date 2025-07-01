import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forms_event.dart';
part 'forms_state.dart';
part 'forms_bloc.freezed.dart';

class FormsBloc extends Bloc<FormsEvent, FormsState> {
  FormsBloc() : super(const FormsState.initial()) {
    on<FormsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
