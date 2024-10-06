import 'package:dartz/dartz.dart';
import 'package:todo_assesment/core/base/failure.dart';
import 'package:todo_assesment/core/base/success.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/model/req/add_todo_req.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/model/res/todo_response.dart';

abstract class HomeTodoRepository{
  Future<Either<Failure,Success>> getTodo();
  Future<Either<Failure,Success>> completeTodo(AddTodoReq req);
}