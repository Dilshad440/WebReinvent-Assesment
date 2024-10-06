import 'package:todo_assesment/core/constant/global_constant.dart';
import 'package:todo_assesment/src/feature/add_todo/data/repository/add_todo_repository_impl.dart';
import 'package:todo_assesment/src/feature/add_todo/data/source/local/add_todo_datasource_impl.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/use_case/add_todo_usecase.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/use_case/delete_todo_usecase.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/use_case/update_todo_usecase.dart';

class AddTodoInjection {
  static injectAddTodo() {
    sl.registerSingleton(AddTodoDataSourceImpl());
    sl.registerSingleton(
        AddTodoRepositoryImpl(sourceImpl: sl.get<AddTodoDataSourceImpl>()));

    /// Use Cases
    _putUseCase();
  }

  static void _putUseCase() {
    sl.registerSingleton<AddTodoUseCase>(
        AddTodoUseCase(addTodoRepositoryImpl: sl.get<AddTodoRepositoryImpl>()));

    sl.registerSingleton(
        UpdateTodoUseCase(repositoryImpl: sl.get<AddTodoRepositoryImpl>()));

    sl.registerSingleton(
        DeleteTodoUseCase(repositoryImpl: sl.get<AddTodoRepositoryImpl>()));
  }
}
