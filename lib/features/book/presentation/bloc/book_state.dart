part of 'book_bloc.dart';

sealed class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

final class BookInitial extends BookState {}

final class BookLoading extends BookState {}

final class BookSuccess extends BookState {
  final String message;
  final OnBookEvent onBookEvent;

  const BookSuccess(
    this.message,
    this.onBookEvent,
  );
}

final class BookFailure extends BookState {
  final String message;
  final OnBookEvent onBookEvent;
  const BookFailure(this.message, this.onBookEvent);
}
