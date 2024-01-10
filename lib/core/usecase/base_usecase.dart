import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:unsplash_flutter/core/failure/failure.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<FailureResponse, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
