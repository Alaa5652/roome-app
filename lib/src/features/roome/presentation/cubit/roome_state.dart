part of 'roome_cubit.dart';

abstract class RoomeState extends Equatable {
  const RoomeState();

  @override
  List<Object> get props => [];
}

class RoomeInitial extends RoomeState {
  const RoomeInitial();
}

class ChangeBottomNavState extends RoomeState {
  final int index;

  const ChangeBottomNavState({required this.index});

  @override
  List<Object> get props => [index];
}

class ChangeBottomNavToHome extends RoomeState {
  const ChangeBottomNavToHome();
}

class GetUserDataLoadingState extends RoomeState {
  const GetUserDataLoadingState();
}

class GetUserDataSuccessState extends RoomeState {
  final UserModel userModel;

  const GetUserDataSuccessState({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class GetUserDataErrorState extends RoomeState {
  final String error;

  const GetUserDataErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class UpdateUserLoadingState extends RoomeState {
  const UpdateUserLoadingState();
}

class UpdateUserSuccessState extends RoomeState {
  final UserModel user;

  const UpdateUserSuccessState({required this.user});

  @override
  List<Object> get props => [user];
}

class UpdateUserErrorState extends RoomeState {
  final String error;

  const UpdateUserErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class ProfileImagePickedSuccessState extends RoomeState {
  const ProfileImagePickedSuccessState();
}

class ProfileImagePickedErrorState extends RoomeState {
  const ProfileImagePickedErrorState();
}

class UploadingProfileImageLoadingState extends RoomeState {
  const UploadingProfileImageLoadingState();
}

class UploadProfileImageSuccessState extends RoomeState {
  final String profileImageUrl;

  const UploadProfileImageSuccessState({required this.profileImageUrl});

  @override
  List<Object> get props => [profileImageUrl];
}

class UploadProfileImageErrorState extends RoomeState {
  final String error;

  const UploadProfileImageErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class SignOutSuccessState extends RoomeState {
  final int? uId;

  const SignOutSuccessState({required this.uId});
}

class SignOutErrorState extends RoomeState {
  final String error;

  const SignOutErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class SwitchEditPassVisibleState extends RoomeState {
  final bool passVisibility;

  const SwitchEditPassVisibleState({required this.passVisibility});

  @override
  List<Object> get props => [passVisibility];
}
