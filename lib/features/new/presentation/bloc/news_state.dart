part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();
  
  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}


final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final String message;
  final OnNewsEvent onNewEvent;
  final NewGetItem? newGetItem;

  const NewsSuccess(
    this.message,
    this.onNewEvent, {
    this.newGetItem,
  });
}

final class NewsFailure extends NewsState {
  final String message;
  final OnNewsEvent onNewEvent;
  const NewsFailure(this.message, this.onNewEvent);
}

