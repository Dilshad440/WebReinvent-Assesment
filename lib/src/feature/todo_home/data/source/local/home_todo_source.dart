import 'package:todo_assesment/src/feature/add_todo/domain/model/req/add_todo_req.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/model/res/todo_response.dart';

abstract class HomeTodoSource{
  Future<List<TodoResponse>> getTodo();
  Future<bool> completeTodo(AddTodoReq req);


}