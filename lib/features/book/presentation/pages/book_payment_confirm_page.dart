import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_choose_exam_info/app_choose_exam_info_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_status/app_status_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/entities/entity_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/order_request_models/order_request_model_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/order/presentation/bloc/order_bloc.dart';
import 'package:mobile_advanced_project_fe/features/status/presentation/bloc/status_bloc.dart';

import '../widgets/widgets.dart';

class BookPaymentConfirmPage extends StatelessWidget {
  const BookPaymentConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<InfoMedicalItem> listInfoMedicalItems = context.select(
        (AppChooseExamInfoCubit cubit) => cubit.state.listInfoMedicalItem);

    final int? price =
        context.select((AppChooseExamInfoCubit cubit) => cubit.state.price);

    final SessionOfDayEntity? section =
        context.select((AppChooseExamInfoCubit cubit) => cubit.state.section);

    final StatusGetItem? statusGetItem =
        context.select((AppStatusCubit cubit) => cubit.state.statusGetItem);

    final String? patientId =
        context.select((AppChooseExamInfoCubit cubit) => cubit.state.patientId);

    return MultiBlocListener(
      listeners: [
        BlocListener<StatusBloc, StatusState>(
          listener: (context, state) {
            if (state is StatusLoading) {
              LoadingOverlay.showLoading(context);
            } else {
              LoadingOverlay.dismissLoading();
            }
          },
        ),
        BlocListener<OrderBloc, OrderState>(
          listener: (context, state) {
            if (state is OrderLoading) {
              LoadingOverlay.showLoading(context);
            } else {
              LoadingOverlay.dismissLoading();
            }

            if (state is OrderSuccess) {
              // Order Payment
              if (state.onOrderEvent == OnOrderEvent.onOrderPayment) {
                if (patientId == null ||
                    listInfoMedicalItems[2].id == '' ||
                    state.paymentItems == null) {
                  ShowSnackBar.error('Thất bại', context);
                } else {
                  context.read<OrderBloc>().add(
                        OrderExcute(orderRequestItems: [
                          OrderRequestItem(
                            patient_id: patientId,
                            payment_id: state.paymentItems!.first.id.toString(),
                            schedule: [listInfoMedicalItems[2].id],
                            sum: price.toString(),
                          )
                        ]),
                      );
                }
              }

              // Order Excute
              if (state.onOrderEvent == OnOrderEvent.onOrderExcute) {
                context.read<OrderBloc>().add(
                      OrderPaymentReturnURL(
                        amount:
                            int.parse(state.orderItems!.first.sum.toString()),
                        order_id: state.orderItems!.first.id.toString(),
                        info: 'String',
                        returnUrl: 'https://online.hcmute.edu.vn/',
                      ),
                    );
              }

              if (state.onOrderEvent == OnOrderEvent.onOrderPaymentReturnURL) {
                context.read<AppChooseExamInfoCubit>().nextStep(3);
                Navigator.of(context)
                    .pushNamed(BookRoutes.BOOK_PAYMENT, arguments: {
                  'link': state.link,
                }).then(
                  (value) => context.read<AppChooseExamInfoCubit>().nextStep(2),
                );
              }
            }

            if (state is OrderFailure) {
              ShowSnackBar.error(state.message, context);
            }
          },
        )
      ],
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Thông tin đặt khám',
        ),
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vui lòng kiểm tra thông tin đặt khám bên dưới. Và tiến hành thanh toán phí tạm thu.',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'CHUYÊN KHOA ĐÃ ĐẶT',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    PaymentConfirmCard(
                      department: listInfoMedicalItems[0].value,
                      day: listInfoMedicalItems[1].value,
                      doctor: listInfoMedicalItems[2].value,
                      price: '$price VNĐ',
                      section: section?.content.toString() ?? "",
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: BookCtaPayment(
                  titlePrice: 'Thanh toán tạm thu:',
                  titleAction: 'THANH TOÁN',
                  price: price.toString(),
                  onTap: () {
                    context.read<OrderBloc>().add(
                          OrderPayment(orderPaymentRequestItems: [
                            OrderPaymentRequestItem(
                                type: 'VNPAY',
                                status_id: statusGetItem!.rows
                                    .firstWhere(
                                        (element) => element.code == 'PENDING')
                                    .id
                                    .toString()),
                          ]),
                        );
                  },
                  disable: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
