import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:to_do/core/usecase/usecase.dart';
import 'package:to_do/core/common/entities/user.dart';
import 'package:to_do/features/auth/domain/use_cases/current_user.dart';
import 'package:to_do/features/auth/domain/use_cases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;
  AuthBloc({required UserSignUp userSignUp, required CurrentUser currentUser,required AppUserCubit appuserCubit})
    : _userSignUp = userSignUp,
      _currentUser = currentUser,
      _appUserCubit = appuserCubit,
      super(AuthInitial()) {
        on<AuthEvent>((event, emit) => emit(AuthLoading()),);
        //onAuthSignUp
    on<AuthSignUp>((event, emit) async {
     // emit(AuthLoading());
      final res = await _userSignUp(
        UserSignUpParams(
          email: event.email,
          name: event.name,
          password: event.password,
        ),
      );
      res.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (user) { 
          log("authSignIn : ${user.email}");
          //emit(AuthSuccess(user));
           _emitAuthSuccess(user,emit);
          }
      );
    });
    //isUserLoggedIn
    on<AuthIsLoggedIn>((event, emit) async {
      final res = await _currentUser(NoParams());
      res.fold((l) => emit(AuthFailure(l.message)), (r) =>
       
       // emit(AuthSuccess(r));
       _emitAuthSuccess(r,emit)
      );
    });
    //////////////////////
  


   
  }
   void _emitAuthSuccess(User user,Emitter<AuthState>emit){
      _appUserCubit.updateUser(user);
      emit(AuthSuccess(user));
    }
}
