import 'package:dartz/dartz.dart';
import 'package:todo_assesment/core/base/failure.dart';
import 'package:todo_assesment/core/base/success.dart';
import 'package:todo_assesment/core/base/use_case.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/model/req/add_todo_req.dart';
import 'package:todo_assesment/src/feature/todo_home/data/repository/home_todo_repository_impl.dart';

class CompleteTodoUseCase extends UseCase<Success, AddTodoReq> {
  final HomeTodoRepositoryImpl repositoryImpl;

  CompleteTodoUseCase({required this.repositoryImpl});

  @override
  Future<Either<Failure, Success>> call(AddTodoReq param) async {
    return await repositoryImpl.completeTodo(param);
  }
}
