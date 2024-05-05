import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_event.dart';
part 'book_state.dart';

enum OnBookEvent {
  onBookUserMakePayment,
}

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial()) {
    on<BookEvent>((_, emit) => emit(BookLoading()));
  }
}
