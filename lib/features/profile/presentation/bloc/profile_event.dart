part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class ProfileChangePassword extends ProfileEvent {
  final String oldPass;
  final String newPass;
  final String confirmPass;

  const ProfileChangePassword({
    required this.oldPass,
    required this.newPass,
    required this.confirmPass,
  });
}

final class ProfileChangeProflie extends ProfileEvent {
  final UserItem userItem;

  const ProfileChangeProflie({
    required this.userItem,
  });
}
