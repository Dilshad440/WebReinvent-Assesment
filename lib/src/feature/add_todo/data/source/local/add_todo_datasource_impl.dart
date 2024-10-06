import 'package:todo_assesment/core/local/local_database.dart';
import 'package:todo_assesment/src/feature/add_todo/data/source/local/add_todo_datasource.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/model/req/add_todo_req.dart';

class AddTodoDataSourceImpl extends AddTodoDataSource with SqfLiteService {
  @override
  Future<bool> saveTodo(AddTodoReq req) async {
    return await super.insertIntoDb(req);
  }

  @override
  Future<bool> deleteTodo(String id) async {
    return await super.deleteInDb(id: id);
  }

  @override
  Future<bool> updateTodo(AddTodoReq req) async {
    return await super.updateInDb(req: req);
  }
}
