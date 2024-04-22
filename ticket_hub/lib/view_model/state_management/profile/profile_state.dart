part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileFetched extends ProfileState {}

class ImageChanged extends ProfileState {}

class UpdateSuccess extends ProfileState {
  String message;
  UpdateSuccess(this.message);
}

class UpdateFailed extends ProfileState {
  String message;
  UpdateFailed(this.message);
}
