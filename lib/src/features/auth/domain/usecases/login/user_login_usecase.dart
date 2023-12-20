import 'package:dartz/dartz.dart';
import 'package:roome/src/core/errors/failure.dart';
import 'package:roome/src/core/models/user/user.dart';
import 'package:roome/src/core/usecases/base_usecase.dart';
import 'package:roome/src/features/auth/domain/entities/login/login_parameters.dart';
import 'package:roome/src/features/auth/domain/repositories/login_repo.dart';

class UserLoginUseCase implements BaseUseCases<UserModel, LoginParameters> {
  final LoginRepo loginRepo;

  const UserLoginUseCase({required this.loginRepo});

  @override
  Future<Either<Failure, UserModel>> call(LoginParameters parameters) async {
    return await loginRepo.userLogin(loginParams: parameters);
  }
}
