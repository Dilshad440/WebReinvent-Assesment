import 'package:dartz/dartz.dart';
import 'package:todo_assesment/core/base/failure.dart';
import 'package:todo_assesment/core/base/success.dart';
import 'package:todo_assesment/core/base/use_case.dart';
import 'package:todo_assesment/src/feature/add_todo/data/repository/add_todo_repository_impl.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/model/req/add_todo_req.dart';

class UpdateTodoUseCase extends UseCase<Success, AddTodoReq> {
  UpdateTodoUseCase({required this.repositoryImpl});

  final AddTodoRepositoryImpl repositoryImpl;

  @override
  Future<Either<Failure, Success>> call(AddTodoReq param) async {
    return await repositoryImpl.updateTodo(param);
  }
}
