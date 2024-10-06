import 'package:dartz/dartz.dart';
import 'package:todo_assesment/core/base/failure.dart';
import 'package:todo_assesment/core/base/success.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/model/req/add_todo_req.dart';

abstract class AddTodoRepository {
  Future<Either<Failure, Success>> saveTodo(AddTodoReq req);

  Future<Either<Failure, Success>> updateTodo(AddTodoReq req);

  Future<Either<Failure, Success>> deleteTodo(String id);
}
