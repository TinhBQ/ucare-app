part of 'app_user_cubit.dart';

sealed class AppUserState extends Equatable {
  final UserItem? userItem;

  const AppUserState({this.userItem});

  @override
  List<Object?> get props => [userItem];
}

final class AppUserInitial extends AppUserState {}

final class AppUserLoggedIn extends AppUserState {
  const AppUserLoggedIn({super.userItem});
  @override
  List<Object?> get props => [userItem];
}
