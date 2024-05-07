import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_new/app_new_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/usecases/usecases.dart';

part 'news_event.dart';
part 'news_state.dart';

enum OnNewsEvent {
  onNewGetList,
  onNewCreateProfile,
}

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final UserGetListNew _userGetListNew;
  final AppNewCubit _appNewCubit;

  NewsBloc({
    required UserGetListNew userGetListNew,
    required AppNewCubit appNewCubit,
  })  : _userGetListNew = userGetListNew,
        _appNewCubit = appNewCubit,
        super(NewsInitial()) {
    on<NewsEvent>((_, emit) => emit(NewsLoading()));
    on<NewGetList>(_onNewGetList);
  }

  void _onNewGetList(
    NewGetList event,
    Emitter<NewsState> emit,
  ) async {
    final res = await _userGetListNew(
      BaseGetRequestModel(
        currentPage: event.currentPage,
        pageSize: event.pageSize,
        filters: event.filters,
        sortField: event.sortField,
        sortOrder: event.sortOrder,
      ),
    );

    res.fold(
      (failure) => emit(NewsFailure(
        failure.message.toString(),
        OnNewsEvent.onNewGetList,
      )),
      (newGetItem) {
        print('newGetItem 1: ${newGetItem.rows.first.id}');
        _appNewCubit.updateNew(newGetItem);

        return emit(NewsSuccess(
          "",
          OnNewsEvent.onNewGetList,
          newGetItem: newGetItem,
        ));
      },
    );
  }
}
