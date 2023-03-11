// import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';

import '../../resources/api_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetHomeList>((event, emit) async {
      try {
        emit(HomeLoading());
        final mList = await apiRepository.fetchHomeList();

        emit(HomeLoaded(mList));
        if (mList == []) {
          emit(const HomeError("No Data"));
        }
      } on NetworkError {
        emit(const HomeError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
