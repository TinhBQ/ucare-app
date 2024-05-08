import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../items/item_dependencies.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(UserItem? userItem) {
    if (userItem == null) {
      emit(AppUserInitial());
    } else {
      emit(AppUserLoggedIn(userItem: userItem));
    }
  }

  void updateAvatar(String avatar) {
    emit(AppUserLoggedIn(
      userItem: state.userItem?.copyWith(avatar: avatar),
    ));
  }
}
