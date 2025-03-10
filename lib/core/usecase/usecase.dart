import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:games/core/error/failure.dart';

abstract interface class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

class NoParam extends Equatable {
  const NoParam();
  @override
  List<Object?> get props => [];
}
