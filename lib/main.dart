import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_assesment/src/feature/add_todo/di/add_todo_di.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/use_case/add_todo_usecase.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/use_case/delete_todo_usecase.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/use_case/update_todo_usecase.dart';
import 'package:todo_assesment/src/feature/add_todo/presentations/bloc/add_todo_cubit.dart';
import 'package:todo_assesment/src/feature/todo_home/di/home_todo_injection.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/use_case/complete_todo_usecase.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/use_case/home_todo_usecase.dart';
import 'package:todo_assesment/src/feature/todo_home/presentations/bloc/home_todo_cubit.dart';
import 'package:todo_assesment/src/feature/todo_home/presentations/pages/todo_home.dart';

import 'core/constant/global_constant.dart';
import 'core/routes/route_manager.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AddTodoInjection.injectAddTodo();
  HomeTodoInjection.injectHomeTodo();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeTodoCubit(
            homeTodoUseCase: sl.get<HomeTodoUseCase>(),
            completeTodoUseCase: sl.get<CompleteTodoUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => AddTodoCubit(
            addTodoUseCase: sl.get<AddTodoUseCase>(),
            deleteTodoUseCase: sl.get<DeleteTodoUseCase>(),
            updateTodoUseCase: sl.get<UpdateTodoUseCase>(),
          ),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        onGenerateRoute: RouteManager.onGenerateRoute,
        title: "WebReinvent Assessment",
        theme: AppTheme.getAppTheme(),
        home: const TodoHome(),
      ),
    );
  }
}
