
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/core/common/entities/user.dart';
import 'package:to_do/core/usecase/usecase.dart';
import 'package:to_do/features/auth/domain/use_cases/current_user.dart';

part 'current_user_event.dart';
part 'current_user_state.dart';

class CurrentUserBloc extends Bloc<CurrentUserEvent, CurrentUserState> {

  CurrentUserBloc() : super(CurrentUserInitial()) {

    on<CurrentUserEvent>((event, emit) {
        CurrentUser? currentuser;
      try {
        emit(CurrentUserLoading());
       currentuser!.call(NoParams()).then((result) {
          result.fold(
            (failure) => emit(CurrentUserFailure(failure.message)),
            (user) => emit(CurrentUserLoaded(user)),
          );
        }); 
      } catch (e) {
        throw Exception(e);
      }
    });
  }
}
