import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/core/entities/no_params.dart';
import 'package:roome/src/core/models/user/user.dart';
import 'package:roome/src/features/auth/domain/entities/login/login_parameters.dart';
import 'package:roome/src/features/auth/domain/usecases/login/user_login_usecase.dart';
import 'package:roome/src/features/auth/domain/usecases/login/login_with_google_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserLoginUseCase loginUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;

  LoginCubit({
    required this.loginUseCase,
    required this.loginWithGoogleUseCase,
  }) : super(const LoginInitial());

  bool loginPassVisibility = true;

  void userSignIn({
    required LoginParameters loginParameters,
  }) {
    emit(const LoginLoadingState());

    loginUseCase(loginParameters).then((value) {
      value.fold(
        (failure) =>
            emit(LoginErrorState(error: failure.failureMsg.toString())),
        (user) {
          emit(LoginSuccessState(
            uId: user.id!,
            userModel: user,
          ));
        },
      );
    });
  }

  void signInWithGoogle() {
    emit(const SignInWithGoogleLoadingState());

    loginWithGoogleUseCase(const NoParams()).then((value) {
      value.fold(
        (failure) => emit(
          SignInWithGoogleErrorState(error: failure.failureMsg.toString()),
        ),
        (user) => emit(SignInWithGoogleSuccessState(uId: user.user!.uid)),
      );
    });
  }

  void switchPassVisibility() {
    loginPassVisibility = !loginPassVisibility;
    emit(SwitchLoginPassVisibleState(passVisibility: loginPassVisibility));
  }

  bool remembered = false;

  void switchRemembered() {
    remembered = !remembered;

    emit(SwitchRememberMeState(remembered: remembered));
  }
}
