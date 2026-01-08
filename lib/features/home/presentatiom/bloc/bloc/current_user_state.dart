part of 'current_user_bloc.dart';


 class CurrentUserState {}

final class CurrentUserInitial extends CurrentUserState {}
final class CurrentUserLoading extends CurrentUserState {}
 final class CurrentUserLoaded extends CurrentUserState {
    final User user;
    CurrentUserLoaded(this.user); 
 }
final class CurrentUserFailure extends CurrentUserState {
  final String error;
  CurrentUserFailure(this.error);
}

