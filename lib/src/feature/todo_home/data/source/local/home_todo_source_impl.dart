import 'package:todo_assesment/core/local/local_database.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/model/req/add_todo_req.dart';
import 'package:todo_assesment/src/feature/todo_home/data/source/local/home_todo_source.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/model/res/todo_response.dart';

class HomeTodoSourceImpl extends HomeTodoSource with SqfLiteService {
  @override
  Future<List<TodoResponse>> getTodo() async {
    return await super.getFromDb();
  }

  @override
  Future<bool> completeTodo(AddTodoReq req) async {
    return await super.updateInDb(req: req);
  }
}
