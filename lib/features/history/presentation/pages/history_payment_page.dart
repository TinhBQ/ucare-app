import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_my_order/app_my_order_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_status/app_status_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/base_get_request_model.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/history/presentation/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/features/order/presentation/bloc/order_bloc.dart';
import 'package:mobile_advanced_project_fe/features/status/presentation/bloc/status_bloc.dart';

class HistoryHistoryPage extends StatefulWidget {
  const HistoryHistoryPage({super.key});

  @override
  State<StatefulWidget> createState() => _HistoryHistoryPageState();
}

class _HistoryHistoryPageState extends State<HistoryHistoryPage> {
  int _currentStep = 0;

  bool _isLoading = false;
  MyOrderGetItem? _myOrderGetItem;
  BaseGetRequestModel? _baseGetRequestModel;
  final ScrollController _scrollController = ScrollController();

  List<StatusItem> statusItems = [];

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);

    if (context.read<AppStatusCubit>().state.statusGetItem?.rows != null) {
      setState(() {
        statusItems = context
            .read<AppStatusCubit>()
            .state
            .statusGetItem!
            .rows
            .where((item) => item.group == 'PAYMENT')
            .toList();
        context
            .read<AppMyOrderCubit>()
            .onChangeStatus(statusItems.first.id.toString());
        _loadData();
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    _myOrderGetItem = context.read<AppMyOrderCubit>().state.myOrderGetItem;

    if (_myOrderGetItem?.totalPages.toString() ==
        _myOrderGetItem?.currentPage.toString()) {
      return;
    }

    if (!_isLoading &&
        _scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isLoading = true;
      });
      context
          .read<AppMyOrderCubit>()
          .nextPage((_myOrderGetItem!.currentPage + 1).toString());
      _loadData();
    }
  }

  void _loadData() {
    _baseGetRequestModel =
        context.read<AppMyOrderCubit>().state.baseGetRequestModel;

    context.read<OrderBloc>().add(
          OrderGetMyList(
            currentPage: _baseGetRequestModel!.currentPage,
            pageSize: _baseGetRequestModel!.pageSize,
            filters: _baseGetRequestModel!.filters,
            sortField: _baseGetRequestModel!.sortField,
            sortOrder: _baseGetRequestModel!.sortOrder,
          ),
        );
  }

  void _onChangeStatus(String statusId) {
    context.read<AppMyOrderCubit>().onChangeStatus(statusId);
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    MyOrderGetItem? myOrderGetItem =
        context.select((AppMyOrderCubit cubit) => cubit.state.myOrderGetItem);

    Widget content = HistoryPaymetListCardWidget(
      myOrderItems: myOrderGetItem?.rows ?? [],
    );

    if (myOrderGetItem == null || ((myOrderGetItem.rows.isEmpty))) {
      content = const SliverToBoxAdapter(
          child: CustomNoData(
        text: 'Không có dữ liệu.',
      ));
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<OrderBloc, OrderState>(
          listener: (context, state) {
            if (state is OrderLoading) {
              LoadingOverlay.showLoading(context);
            } else if (state is OrderFailure) {
              LoadingOverlay.dismissLoading();
              ShowSnackBar.error(state.message, context);
            } else if (state is OrderSuccess) {
              LoadingOverlay.dismissLoading();
              // ShowSnackBar.success(state.message, context);
            }
          },
        ),
        BlocListener<StatusBloc, StatusState>(
          listener: (context, state) {
            if (state is StatusLoading) {
              LoadingOverlay.showLoading(context);
            } else if (state is StatusFailure) {
              LoadingOverlay.dismissLoading();
              // ShowSnackBar.error(state.message, context);
            } else if (state is StatusSuccess) {
              if (state.onStatusEvent == OnStatusEvent.onStatusGetList) {
                setState(() {
                  statusItems = context
                      .read<AppStatusCubit>()
                      .state
                      .statusGetItem!
                      .rows
                      .where((item) => item.group == 'PAYMENT')
                      .toList();
                  context
                      .read<AppMyOrderCubit>()
                      .onChangeStatus(statusItems.first.id.toString());
                  _loadData();
                });
              }
              LoadingOverlay.dismissLoading();
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Lịch sử thanh toán',
          background: Theme.of(context).colorScheme.tertiary,
          color: Colors.white,
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: MultiOptionalWidget(
                currentStep: _currentStep,
                onStepSelected: (int step, String statusId) {
                  setState(() {
                    _currentStep = step;
                  });
                  _onChangeStatus(statusId);
                },
                statusItems: statusItems,
              ),
            ),
            content
          ],
        ),
      ),
    );
  }
}
