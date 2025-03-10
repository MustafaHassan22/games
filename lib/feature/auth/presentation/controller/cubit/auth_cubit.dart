import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/core/error/failure.dart';
import 'package:games/feature/auth/domain/entitie/user.dart';
import 'package:games/feature/auth/domain/use_cases/login_usecase.dart';
import 'package:games/feature/auth/domain/use_cases/sign_up_usecase.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpUsecase _signUpUsecase;
  final LoginUsecase _loginUsecase;
  AuthCubit({
    required SignUpUsecase signUpUsecase,
    required LoginUsecase loginUsecase,
  })  : _signUpUsecase = signUpUsecase,
        _loginUsecase = loginUsecase,
        super(AuthInitial());

  Future<void> signUp(String email, String password) => _authenticate(
      action: () =>
          _signUpUsecase(SignUpParam(email: email, password: password)));

  Future<void> login(String email, String password) => _authenticate(
      action: () =>
          _loginUsecase(LoginParam(email: email, password: password)));

//method to reduce duplicated code for login and signup
  Future<void> _authenticate({
    required Future<Either<Failure, User>> Function() action,
  }) async {
    emit(AuthLoading());
    final result = await action();
    result.fold(
      (failure) => emit(AuthFailure(failure.errMessage)),
      (user) => emit(AuthSuccess(user)),
    );
  }
}




  // void _handleResult(Either<Failure, User> result) {
  //   result.fold(
  //     (l) => emit(AuthFailure(l.errMessage)),
  //     (user) => emit(AuthSuccess(user)),
  //   );
  // }