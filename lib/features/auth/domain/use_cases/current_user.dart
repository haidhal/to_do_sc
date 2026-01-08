import 'package:fpdart/fpdart.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/core/usecase/usecase.dart';
import 'package:to_do/core/common/entities/user.dart';
import 'package:to_do/features/auth/domain/repository/auth_repository.dart';

class CurrentUser implements Usecase<User,NoParams>{
  final AuthRepository authRepository;

  CurrentUser( this.authRepository);
  
  @override
  Future<Either<Failure, User>> call(NoParams params)async {
 return await authRepository.currentUser();
  }
  
}

