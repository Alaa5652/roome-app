import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/roome/domain/entities/fav_params.dart';
import 'package:roome/src/features/roome/domain/repositories/favorite_repo.dart';

class AddToFavUseCase implements BaseUseCases<dynamic, FavParams> {
  final FavoriteRepo favoriteRepo;

  const AddToFavUseCase({required this.favoriteRepo});

  @override
  Future<Either<Failure, dynamic>> call(FavParams params) async {
    return await favoriteRepo.addToFav(
      uId: params.uId,
      hotelId: params.hotelId,
    );
  }
}