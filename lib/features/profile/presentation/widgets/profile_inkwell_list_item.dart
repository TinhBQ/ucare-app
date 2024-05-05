import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';

import 'proflie_inkwell_item.dart';

List<ProfileItem> getProfileItems(BuildContext context) => [
      ProfileItem(
        title: 'Hồ sơ cá nhân',
        icon: Icons.insert_drive_file_rounded,
        callback: () {
          Navigator.of(context).pushNamed(AppRoutes.CHANGE_PROFILE);
        },
      ),
      ProfileItem(
        title: 'Cài đặt',
        icon: Icons.settings,
        callback: () {
          Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
        },
      ),
      ProfileItem(
        title: 'Đổi mật khẩu',
        icon: Icons.lock,
        callback: () {
          Navigator.of(context).pushNamed(AppRoutes.CHANGE_PASSWORD);
        },
      ),
      ProfileItem(
        title: 'Đăng xuất',
        icon: Icons.logout_outlined,
        callback: () {
          ShowDialog.confirm(
            context,
            title: 'Bạn chắc chắn muốn đăng xuất?',
            callback: () {
              context.read<AuthBloc>().add(AuthLogout());
            },
          );
        },
        hideIconNavigation: true,
      ),
    ];

class ProfileInkwellListItemWidget extends StatelessWidget {
  const ProfileInkwellListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 32),
      child: Column(
        children: [
          ...getProfileItems(context).map(
            (item) => ProflieInkwellItemProfileWidget(
              icon: item.icon,
              title: item.title,
              ontap: item.callback,
              hideIconNavigation: item.hideIconNavigation,
            ),
          ),
        ],
      ),
    );
  }
}
