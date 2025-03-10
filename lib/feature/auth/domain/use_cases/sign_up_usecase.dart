import 'package:dartz/dartz.dart';

import 'package:games/core/error/failure.dart';
import 'package:games/core/usecase/usecase.dart';
import 'package:games/feature/auth/domain/entitie/user.dart';
import 'package:games/feature/auth/domain/repo/auth_repo.dart';

class SignUpUsecase implements UseCase<User, SignUpParam> {
  final AuthRepo _authRepo;

  SignUpUsecase(this._authRepo);

  @override
  Future<Either<Failure, User>> call(SignUpParam param) async {
    return await _authRepo.signUp(param.email, param.password);
  }
}

class SignUpParam {
  final String email;
  final String password;

  SignUpParam({required this.email, required this.password});
}
