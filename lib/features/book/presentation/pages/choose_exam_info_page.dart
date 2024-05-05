import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/names/names.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_choose_exam_info/app_choose_exam_info_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/bloc/book_bloc.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

import '../widgets/choose_exam_info_list_item.dart';

class ChooseExamInfoPage extends StatelessWidget {
  const ChooseExamInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<InfoMedicalItem> listInfoMedicalItems = context.select(
        (AppChooseExamInfoCubit bloc) => bloc.state.listInfoMedicalItem);

    final int? price =
        context.select((AppChooseExamInfoCubit bloc) => bloc.state.price);

    return MultiBlocListener(
      listeners: [
        BlocListener<BookBloc, BookState>(
          listener: (context, state) {
            if (state is BookLoading) {
              LoadingOverlay.showLoading(context);
            }

            // if (state is BookSuccess) {
            //   if (state.onBookEvent == OnBookEvent.onBookUserMakePayment) {
            //     Navigator.of(context)
            //         .pushNamed(BookRoutes.BOOK_PAYMENT, arguments: {
            //       'link': state.paymentResultItem!.link,
            //     });
            //   }
            // }

            if (state is BookFailure) {
              ShowSnackBar.error(state.message, context);
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        appBar: const CustomSubAppBar(
          title: 'Đặt lịch khám',
        ),
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ChooseExamInfoListItem(
                    listInfoMedicalItems: listInfoMedicalItems,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: BookCtaPayment(
                titlePrice: 'Thanh toán tạm tính:',
                titleAction: 'TIẾP THEO',
                price: price.toString(),
                onTap: () {
                  context.read<AppChooseExamInfoCubit>().nextStep(2);
                  Navigator.of(context)
                      .pushNamed(BookRoutes.BOOK_PAYMENT_CONFIRM)
                      .then(
                        (value) =>
                            context.read<AppChooseExamInfoCubit>().nextStep(1),
                      );
                },
                disable: listInfoMedicalItems[2].value == "",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
