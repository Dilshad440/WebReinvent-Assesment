import 'package:dartz/dartz.dart';
import 'package:todo_assesment/core/base/failure.dart';
import 'package:todo_assesment/core/base/success.dart';
import 'package:todo_assesment/src/feature/add_todo/data/source/local/add_todo_datasource_impl.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/model/req/add_todo_req.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/repository/add_todo_repository.dart';

class AddTodoRepositoryImpl implements AddTodoRepository {
  final AddTodoDataSourceImpl sourceImpl;

  AddTodoRepositoryImpl({required this.sourceImpl});

  @override
  Future<Either<Failure, Success>> saveTodo(AddTodoReq req) async {
    try {
      final result = await sourceImpl.saveTodo(req);
      return Right(Success(message: "Todo saved successfully", data: result));
    } catch (e) {
      return Left(Failure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, Success>> deleteTodo(String id) async {
    try {
      final data = await sourceImpl.deleteTodo(id);
      return Right(Success(message: "Successfully deleted todo", data: data));
    } catch (e) {
      return Left(Failure(message: "Failed to delete todo"));
    }
  }

  @override
  Future<Either<Failure, Success>> updateTodo(AddTodoReq req) async {
    try {
      final data = await sourceImpl.updateTodo(req);
      return Right(Success(message: "Successfully updated Todo", data: data));
    } catch (e) {
      return Left(Failure(message: "Failed to update todo"));
    }
  }
}
