import 'package:flutter/material.dart';
import 'package:todo_assesment/core/routes/route_constant.dart';
import 'package:todo_assesment/src/feature/add_todo/presentations/pages/add_todo.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/model/res/todo_response.dart';

class RouteManager {
  static PageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConsts.addTodo:
        return MyCustomRoute(
          builder: (context) => const AddTodo(),
        );

      case RouteConsts.updateTodo:
        final arg = settings.arguments as TodoResponse?;
        return MyCustomRoute(
          builder: (context) => AddTodo(todo: arg),
        );
    }
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('404!!\nRoutes not found:=> ${settings.name}',
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({required super.builder, super.settings, this.transition})
      : super(fullscreenDialog: false);
  final Widget? transition;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return transition ?? FadeTransition(opacity: animation, child: child);
  }
}
