import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/helpers/helper.dart';
import 'package:roome/src/core/models/user/hotel.dart';
import 'package:roome/src/features/home/domain/usecases/recommended/get_recommended_hotels_usecase.dart';

part 'recommended_state.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  final GetRecommendedHotelsUseCase getRecommendedHotelsUseCase;

  RecommendedCubit({required this.getRecommendedHotelsUseCase})
      : super(const RecommendedInitial());

  void getRecommendedHotels() {
    emit(const GetRecommendedHotelsLoadingState());

    getRecommendedHotelsUseCase(Helper.uId).then((value) {
      value.fold(
        (failure) {
          emit(GetRecommendedHotelsErrorState(
              error: failure.failureMsg.toString()));
        },
        (recommendedHotels) {
          emit(GetRecommendedHotelsSuccessState(
            recommendedHotels: recommendedHotels,
          ));
        },
      );
    });
  }
}
