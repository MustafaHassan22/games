import 'package:dartz/dartz.dart';
import 'package:games/core/error/failure.dart';
import 'package:games/core/usecase/usecase.dart';
import 'package:games/feature/auth/domain/entitie/user.dart';
import 'package:games/feature/auth/domain/repo/auth_repo.dart';

class LoginUsecase implements UseCase<User, LoginParam> {
  final AuthRepo _authRepo;

  LoginUsecase(this._authRepo);
  @override
  Future<Either<Failure, User>> call(LoginParam param) async {
    return await _authRepo.login(param.email, param.password);
  }
}

class LoginParam {
  final String email;
  final String password;

  LoginParam({required this.email, required this.password});
}
