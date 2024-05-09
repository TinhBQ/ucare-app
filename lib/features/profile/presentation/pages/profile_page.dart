import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/bloc/profile_bloc.dart';

import '../widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> pickImage(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      File file = File(result.files.single.path!);

      String fileName = result.files.single.name;
      // ignore: use_build_context_synchronously
      context.read<ProfileBloc>().add(
            ProfileUploadFile(
                formData: FormData.fromMap({
              'file': await MultipartFile.fromFile(
                file.path,
                filename: fileName,
              ),
            })),
          );
      // Do something with the selected image file, like upload it
    } else {
      // User canceled the file picker
    }
  }

  @override
  Widget build(BuildContext context) {
    UserItem? userItem =
        context.select((AppUserCubit cubit) => cubit.state.userItem);

    return MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                LoadingOverlay.showLoading(context);
              }

              if (state is AuthFailure) {
                LoadingOverlay.dismissLoading();
                ShowSnackBar.error(state.message, context);
              }

              if (state is AuthSuccess) {
                if (state.onAuthEvent == OnAuthEvent.onAuthLogout) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.SING_IN, (route) => false);
                }

                LoadingOverlay.dismissLoading();
                ShowSnackBar.success(state.message, context);
              }
            },
          ),
          BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is ProfileLoading) {
                LoadingOverlay.showLoading(context);
              }
              if (state is ProfileFailure) {
                LoadingOverlay.dismissLoading();
                ShowSnackBar.error(state.message, context);
              }
              if (state is ProfileSuccess) {
                if (state.onProfileEvent ==
                    OnProfileEvent.onProfileUploadFile) {
                  context.read<ProfileBloc>().add(
                        ProfileChangeProflie(
                          userItem: context
                              .read<AppUserCubit>()
                              .state
                              .userItem!
                              .copyWith(
                                avatar: state.fileItem?.fileName ?? '',
                              ),
                        ),
                      );
                }

                if (state.onProfileEvent ==
                    OnProfileEvent.onProfileChangeProflie) {
                  ShowSnackBar.success(state.message, context);
                }

                LoadingOverlay.dismissLoading();
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: ProflieIntroduceWidget(),
              ),
              SliverToBoxAdapter(
                child: ProfileShortWidget(
                  name: stringTernaryOperatir(userItem?.user_name, 'No Name'),
                  email: stringTernaryOperatir(userItem?.email, 'No Email'),
                  avatar: stringTernaryOperatir(userItem?.avatar, 'String'),
                  onTap: () {
                    pickImage(context);
                  },
                ),
              ),
              const SliverToBoxAdapter(
                child: ProfileInkwellListItemWidget(),
              ),
            ],
          ),
        ));
  }
}
