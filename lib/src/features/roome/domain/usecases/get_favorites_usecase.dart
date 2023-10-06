import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/roome/domain/entities/user_params.dart';
import 'package:roome/src/features/roome/domain/repositories/room_repo.dart';

class GetFavoritesUseCase implements BaseUseCases<dynamic, UserParams> {
  final RoomRepo roomRepo;

  const GetFavoritesUseCase({required this.roomRepo});

  @override
  Future<Either<Failure, dynamic>> call(UserParams params) async {
    return await roomRepo.getFavorites(userId: params.id!);
  }
}