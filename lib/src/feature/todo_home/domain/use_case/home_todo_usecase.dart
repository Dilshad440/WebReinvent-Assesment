import 'package:dartz/dartz.dart';
import 'package:todo_assesment/core/base/failure.dart';
import 'package:todo_assesment/core/base/no_param.dart';
import 'package:todo_assesment/core/base/success.dart';
import 'package:todo_assesment/core/base/use_case.dart';
import 'package:todo_assesment/src/feature/todo_home/data/repository/home_todo_repository_impl.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/model/res/todo_response.dart';

class HomeTodoUseCase extends UseCase<Success, NoParam> {
  final HomeTodoRepositoryImpl repositoryImpl;

  HomeTodoUseCase({required this.repositoryImpl});

  @override
  Future<Either<Failure, Success>> call(NoParam param) async {
    return await repositoryImpl.getTodo();
  }
}
