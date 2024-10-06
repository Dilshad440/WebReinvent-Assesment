import 'package:todo_assesment/core/constant/global_constant.dart';
import 'package:todo_assesment/src/feature/todo_home/data/repository/home_todo_repository_impl.dart';
import 'package:todo_assesment/src/feature/todo_home/data/source/local/home_todo_source_impl.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/use_case/complete_todo_usecase.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/use_case/home_todo_usecase.dart';

class HomeTodoInjection {
  static injectHomeTodo() {
    sl.registerSingleton(HomeTodoSourceImpl());
    sl.registerSingleton(HomeTodoRepositoryImpl(sl.get<HomeTodoSourceImpl>()));
    _putUseCase();
  }

  static void _putUseCase() {
    sl.registerSingleton(
        HomeTodoUseCase(repositoryImpl: sl.get<HomeTodoRepositoryImpl>()));

    sl.registerSingleton(
        CompleteTodoUseCase(repositoryImpl: sl.get<HomeTodoRepositoryImpl>()));
  }
}
