part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final String message;
  final OnProfileEvent onProfileEvent;
  final FileItem? fileItem;

  const ProfileSuccess(
    this.message,
    this.onProfileEvent, {
    this.fileItem,
  });
}

final class ProfileFailure extends ProfileState {
  final String message;
  final OnProfileEvent onProfileEvent;
  const ProfileFailure(this.message, this.onProfileEvent);
}
