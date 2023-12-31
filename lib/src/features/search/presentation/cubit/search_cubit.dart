import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roome/src/core/models/user/hotel.dart';
import 'package:roome/src/features/search/domain/usecases/search_hotels_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchHotelsUseCase searchHotelsUseCase;

  SearchCubit({required this.searchHotelsUseCase})
      : super(const SearchInitial());

  void searchHotels({required String hotelName}) {
    emit(const SearchLoadingState());

    searchHotelsUseCase(hotelName).then((value) {
      value.fold(
        (failure) {
          debugPrint('ERROR: ${failure.failureMsg.toString()}');
          emit(SearchErrorState(errorMessage: failure.failureMsg.toString()));
        },
        (hotels) => emit(SearchSuccessState(hotels: hotels)),
      );
    });
  }
}
