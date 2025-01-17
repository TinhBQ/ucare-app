import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import '../../domain/usecases/usecases.dart';

part 'profile_event.dart';
part 'profile_state.dart';

enum OnProfileEvent {
  onProfileChangePassword,
  onProfileChangeProflie,
  onProfileUploadFile,
}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserChangePassword _userChangePassword;
  final UserChangeProfile _userChangeProfile;
  final UserUploadFile _userUploadFile;
  final AppUserCubit _appUserCubit;

  ProfileBloc({
    required UserChangePassword userChangePassword,
    required UserChangeProfile userChangeProfile,
    required UserUploadFile userUploadFile,
    required AppUserCubit appUserCubit,
  })  : _userChangePassword = userChangePassword,
        _userChangeProfile = userChangeProfile,
        _userUploadFile = userUploadFile,
        _appUserCubit = appUserCubit,
        super(
          ProfileInitial(),
        ) {
    on<ProfileEvent>((_, emit) => emit(ProfileLoading()));
    on<ProfileChangePassword>(_onProfileChangePassword);
    on<ProfileChangeProflie>(_onProfileChangeProflie);
    on<ProfileUploadFile>(_onProfileUploadFile);
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
          OnProfileEvent.onProfileChangeProflie,
        ),
      ),
      (userItem) {
        _appUserCubit.updateUser(userItem);

        return emit(
          ProfileSuccess(
            InforMassage.CHANGE_PROFLE_SUCCESS,
            OnProfileEvent.onProfileChangeProflie,
          ),
        );
      },
    );
  }

  void _onProfileUploadFile(
    ProfileUploadFile event,
    Emitter<ProfileState> emit,
  ) async {
    final res = await _userUploadFile(event.formData);
    res.fold(
      (failure) => emit(
        ProfileFailure(
          failure.message.toString(),
          OnProfileEvent.onProfileUploadFile,
        ),
      ),
      (fileItem) {
        _appUserCubit.updateAvatar(fileItem.fileName);

        return emit(
          ProfileSuccess(
            InforMassage.CHANGE_PROFLE_SUCCESS,
            OnProfileEvent.onProfileUploadFile,
            fileItem: fileItem,
          ),
        );
      },
    );
  }
}
