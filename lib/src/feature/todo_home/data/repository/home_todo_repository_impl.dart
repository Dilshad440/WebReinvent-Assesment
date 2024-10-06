import 'package:dartz/dartz.dart';
import 'package:todo_assesment/core/base/failure.dart';
import 'package:todo_assesment/core/base/success.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/model/req/add_todo_req.dart';
import 'package:todo_assesment/src/feature/todo_home/data/source/local/home_todo_source_impl.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/model/res/todo_response.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/repository/home_todo_repository.dart';

class HomeTodoRepositoryImpl implements HomeTodoRepository {
  final HomeTodoSourceImpl sourceImpl;

  HomeTodoRepositoryImpl(this.sourceImpl);

  @override
  Future<Either<Failure, Success>> getTodo() async {
    try {
      final result = await sourceImpl.getTodo();
      return Right(Success(message: "Todo fetched successfully", data: result));
    } catch (e) {
      return Left(Failure(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, Success>> completeTodo(AddTodoReq req) async {
    try {
      final data = await sourceImpl.completeTodo(req);
      return Right(Success(message: "Todo Marked as completed", data: data));
    } catch (e) {
      return Left(Failure(message: "Failed to completed todo"));
    }
  }
}
