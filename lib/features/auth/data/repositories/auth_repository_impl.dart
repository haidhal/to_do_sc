import 'package:fpdart/src/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:to_do/core/error/exception.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:to_do/core/common/entities/user.dart';
import 'package:to_do/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, User>> signUpWithEmailAndPAsswor({
    required String name,
    required String email,
    required String padssword,
  }) async {
    try {
      final user = await remoteDataSource.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: padssword,
      );

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
  
  @override
  Future<Either<Failure, User>> currentUser()async {
  try {
    final user = await remoteDataSource.getCurrentUserData();
    if(user == null){
      return left(Failure("User not logged in!"));
    }
    return right(user);
  }on ServerException catch (e) {
     return left(Failure(e.message));
  }
  }


  Future<Either<Failure, User>> _getUser(
    Future<User> Function() fn,
  )async{
    try {
      final user = await fn();
      return right(user);
    } on sb.AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch(e){
       return left(Failure(e.message));
    }

  }

  


}
