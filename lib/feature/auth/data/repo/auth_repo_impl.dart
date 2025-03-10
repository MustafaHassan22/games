import 'package:dartz/dartz.dart';
import 'package:games/core/error/failure.dart';
import 'package:games/feature/auth/data/data_sorce/auth_remote_data_source.dart';
import 'package:games/feature/auth/domain/entitie/user.dart';
import 'package:games/feature/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthRemoteDataSource _firebaseAuthRemoteDataSource;

  AuthRepoImpl(this._firebaseAuthRemoteDataSource);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel =
          await _firebaseAuthRemoteDataSource.login(email, password);
      return right(userModel.toEntity());
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUp(String email, String password) async {
    try {
      final userModel =
          await _firebaseAuthRemoteDataSource.signUp(email, password);
      return right(userModel.toEntity());
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await _firebaseAuthRemoteDataSource.logOut();
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
