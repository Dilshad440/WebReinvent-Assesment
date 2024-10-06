import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_assesment/core/components/common_app_bar.dart';
import 'package:todo_assesment/core/constant/global_constant.dart';
import 'package:todo_assesment/core/routes/route_constant.dart';
import 'package:todo_assesment/core/theme/app_colors.dart';
import 'package:todo_assesment/core/theme/app_textstyle.dart';
import 'package:todo_assesment/main.dart';
import 'package:todo_assesment/src/feature/add_todo/presentations/bloc/add_todo_cubit.dart';
import 'package:todo_assesment/src/feature/add_todo/presentations/pages/add_todo.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/model/res/todo_response.dart';
import 'package:todo_assesment/src/feature/todo_home/presentations/bloc/home_todo_cubit.dart';
import 'package:todo_assesment/src/feature/todo_home/presentations/widget/todo_tile.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<HomeTodoCubit>().getTodos();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Home"),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onAddTodoClick(),
        child: const Icon(Icons.add, color: AppColors.white, size: 30),
      ),
      body: BlocBuilder<HomeTodoCubit, HomeTodoState>(
        builder: (context, state) {
          if (state.apistate == APISTATE.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            itemBuilder: (context, index) {
              final todo = state.todos?[index];
              return Card(
                elevation: 6,
                margin: EdgeInsets.zero,
                child: TodoTile(
                  onTileClick: () => onUpdateTodoClick(todo),
                  todoResponse: todo,
                  onCompleted: (val) => _onCompleteTodo(todo),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: state.todos?.length ?? 0,
          );
        },
      ),
    );
  }

  void _onCompleteTodo(TodoResponse? todo) {
    context.read<HomeTodoCubit>().completeTodo(todo);
  }

  void onAddTodoClick() async {
    final result = await push(RouteConsts.addTodo);
    if (result == true) {
      context.read<HomeTodoCubit>().getTodos();
    }
  }

  void onUpdateTodoClick(TodoResponse? todo) async {
    final result = await push(RouteConsts.updateTodo, arg: todo);
    if (result == true) {
      context.read<HomeTodoCubit>().getTodos();
    }
  }
}
