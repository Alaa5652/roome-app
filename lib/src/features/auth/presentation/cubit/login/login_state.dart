part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}

class LoginSuccessState extends LoginState {
  final int uId;
  final UserModel userModel;
  const LoginSuccessState({required this.userModel, required this.uId});

  @override
  List<Object> get props => [uId, userModel];
}

class LoginErrorState extends LoginState {
  final String error;
  const LoginErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class SignInWithGoogleLoadingState extends LoginState {
  const SignInWithGoogleLoadingState();
}

class SignInWithGoogleSuccessState extends LoginState {
  final String uId;
  const SignInWithGoogleSuccessState({required this.uId});

  @override
  List<Object> get props => [uId];
}

class SignInWithGoogleErrorState extends LoginState {
  final String error;
  const SignInWithGoogleErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class SwitchLoginPassVisibleState extends LoginState {
  final bool passVisibility;

  const SwitchLoginPassVisibleState({required this.passVisibility});

  @override
  List<Object> get props => [passVisibility];
}

class SwitchRememberMeState extends LoginState {
  final bool remembered;

  const SwitchRememberMeState({required this.remembered});

  @override
  List<Object> get props => [remembered];
}
