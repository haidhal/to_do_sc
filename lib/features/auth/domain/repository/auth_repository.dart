import 'package:fpdart/fpdart.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/core/common/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailAndPAsswor({
    required String name,
    required String email,
    required String padssword,
  });

  Future<Either<Failure, User>> currentUser();

  
}
