import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_choose_exam_info/app_choose_exam_info_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class BookBySpecialtyPage extends StatefulWidget {
  const BookBySpecialtyPage({super.key});

  @override
  State<StatefulWidget> createState() => _BookBySpecialtyPageState();
}

class _BookBySpecialtyPageState extends State<BookBySpecialtyPage> {
  @override
  Widget build(BuildContext context) {
    int numFlow =
        context.select((AppChooseExamInfoCubit bloc) => bloc.state.numFlow);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Đặt lịch khám',
        background: Theme.of(context).colorScheme.tertiary,
        color: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MultiStepperWidget(
            currentStep: numFlow,
          ),
          const Flexible(
            child: Navigator(
              onGenerateRoute: BookPages.GenerateRouteSettings,
            ),
          ),
        ],
      ),
    );
  }
}
