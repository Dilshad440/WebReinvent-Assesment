import 'package:dartz/dartz.dart';
import 'package:todo_assesment/core/base/failure.dart';
import 'package:todo_assesment/core/base/success.dart';
import 'package:todo_assesment/core/base/use_case.dart';
import 'package:todo_assesment/src/feature/add_todo/data/repository/add_todo_repository_impl.dart';
import 'package:todo_assesment/src/feature/todo_home/data/repository/home_todo_repository_impl.dart';

class DeleteTodoUseCase extends UseCase<Success, String> {
  final AddTodoRepositoryImpl repositoryImpl;

  DeleteTodoUseCase({required this.repositoryImpl});

  @override
  Future<Either<Failure, Success>> call(String param) async {
    return await repositoryImpl.deleteTodo(param);
  }
}
