import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_assesment/core/base/no_param.dart';
import 'package:todo_assesment/core/constant/global_constant.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/model/req/add_todo_req.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/model/res/todo_response.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/use_case/complete_todo_usecase.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/use_case/home_todo_usecase.dart';
import 'package:todo_assesment/src/utils/common_utils.dart';

part 'home_todo_state.dart';

class HomeTodoCubit extends Cubit<HomeTodoState> {
  final HomeTodoUseCase homeTodoUseCase;
  final CompleteTodoUseCase completeTodoUseCase;

  HomeTodoCubit({
    required this.homeTodoUseCase,
    required this.completeTodoUseCase,
  }) : super(HomeTodoState());

  void getTodos() async {
    emit(state.copyWith(todos: [], apistate: APISTATE.loading));
    final data = await homeTodoUseCase.call(NoParam());
    data.fold(
      (l) {
        emit(state.copyWith(apistate: APISTATE.error));
        CommonUtils.showErrorToast(l.message);
      },
      (r) {
        emit(state.copyWith(apistate: APISTATE.loaded, todos: r.data));
        CommonUtils.showSuccessToast(r.message);
      },
    );
  }

  void completeTodo(TodoResponse? todo) async {
    final param = AddTodoReq(
        title: todo?.title,
        id: todo?.id,
        isCompleted: !(todo?.isCompleted ?? false),
        description: todo?.description,
        createdAt: todo?.createdAt);
    final data = await completeTodoUseCase.call(param);
    data.fold(
      (l) {
        CommonUtils.showErrorToast(l.message);
      },
      (r) {
        CommonUtils.showSuccessToast(r.message);
        getTodos();
      },
    );
  }
}
