part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class SignInLoadingState extends LoginState {}

class SignInSuccessState extends LoginState {
  final int uId;
  final UserModel userModel;
  const SignInSuccessState({required this.userModel, required this.uId});

  @override
  List<Object> get props => [uId, userModel];
}

class SignInErrorState extends LoginState {
  final String error;
  const SignInErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class SignInWithGoogleLoadingState extends LoginState {}

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

class SwitchPassVisibleState extends LoginState {
  final bool passVisibility;

  const SwitchPassVisibleState({required this.passVisibility});

  @override
  List<Object> get props => [passVisibility];
}
