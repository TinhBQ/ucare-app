import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';

import 'init_dependencies.main.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      ];
}
