import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/user_request_models/change_password_request_model.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils.dart';

import '../../../../core/common/cubits/app_user/app_user_cubit.dart';
import '../../domain/usecases/usecases.dart';

part 'profile_event.dart';
part 'profile_state.dart';

enum OnProfileEvent { onProfileChangePassword }

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserChangePassword _userChangePassword;
  final UserChangeProfile _userChangeProfile;
  final AppUserCubit _appUserCubit;

  ProfileBloc({
    required UserChangePassword userChangePassword,
    required UserChangeProfile userChangeProfile,
    required AppUserCubit appUserCubit,
  })  : _userChangePassword = userChangePassword,
        _userChangeProfile = userChangeProfile,
        _appUserCubit = appUserCubit,
        super(
          ProfileInitial(),
        ) {
    on<ProfileEvent>((_, emit) => emit(ProfileLoading()));
    on<ProfileChangePassword>(_onProfileChangePassword);
    on<ProfileChangeProflie>(_onProfileChangeProflie);
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

  void _onProfileChangeProflie(
    ProfileChangeProflie event,
    Emitter<ProfileState> emit,
  ) async {
    final res = await _userChangeProfile(event.userItem);
    res.fold(
      (failure) => emit(
        ProfileFailure(
          failure.message.toString(),
          OnProfileEvent.onProfileChangePassword,
        ),
      ),
      (userItem) {
        _appUserCubit.updateUser(userItem);
        return emit(
          ProfileSuccess(
            InforMassage.CHANGE_PROFLE_SUCCESS,
            OnProfileEvent.onProfileChangePassword,
          ),
        );
      },
    );
  }
}
