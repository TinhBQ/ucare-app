import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationInitial()) {
    on<TriggerAppEvent>((event, emit) {
      emit(ApplicationChangeIndex(index: event.index));
    });
  }
}
