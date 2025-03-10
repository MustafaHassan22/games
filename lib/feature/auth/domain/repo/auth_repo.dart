import 'package:dartz/dartz.dart';
import 'package:games/core/error/failure.dart';
import 'package:games/feature/auth/domain/entitie/user.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> signUp(String email, String password);
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, void>> logOut();
}
