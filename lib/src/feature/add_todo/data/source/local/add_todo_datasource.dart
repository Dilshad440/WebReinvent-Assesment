import 'package:todo_assesment/src/feature/add_todo/domain/model/req/add_todo_req.dart';

abstract class AddTodoDataSource {
  Future<bool> saveTodo(AddTodoReq req);

  Future<bool> updateTodo(AddTodoReq req);

  Future<bool> deleteTodo(String id);
}
