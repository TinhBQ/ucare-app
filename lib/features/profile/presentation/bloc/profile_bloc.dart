import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/user_request_models/change_password_request_model.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/features/profile/domain/usecases/user_change_password.dart';

part 'profile_event.dart';
part 'profile_state.dart';

enum OnProfileEvent { onProfileChangePassword }

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserChangePassword _userChangePassword;

  ProfileBloc({
    required UserChangePassword userChangePassword,
  })  : _userChangePassword = userChangePassword,
        super(
          ProfileInitial(),
        ) {
    on<ProfileEvent>((_, emit) => emit(ProfileLoading()));
    on<ProfileChangePassword>(_onProfileChangePassword);
  }

  void _onProfileChangePassword(
    ProfileChangePassword event,
    Emitter<ProfileState> emit,
  ) async {
    final res = await _userChangePassword(
      ChangePasswordRequestModel(
        oldPass: event.oldPass,
        newPass: event.newPass,
        confirmPass: event.confirmPass,
      ),
    );

    res.fold(
      (failure) => emit(ProfileFailure(
        failure.message.toString(),
        OnProfileEvent.onProfileChangePassword,
      )),
      (massage) => emit(ProfileSuccess(
        massage.toString(),
        OnProfileEvent.onProfileChangePassword,
      )),
    );
  }
}
