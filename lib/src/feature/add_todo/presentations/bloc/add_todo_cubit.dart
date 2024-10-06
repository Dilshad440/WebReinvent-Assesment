import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_assesment/core/constant/global_constant.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/model/req/add_todo_req.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/use_case/add_todo_usecase.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/use_case/delete_todo_usecase.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/use_case/update_todo_usecase.dart';
import 'package:todo_assesment/src/utils/common_utils.dart';
import 'package:uuid/uuid.dart';

part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  AddTodoCubit({
    required this.addTodoUseCase,
    required this.updateTodoUseCase,
    required this.deleteTodoUseCase,
  }) : super(const AddTodoState());

  final AddTodoUseCase addTodoUseCase;
  final UpdateTodoUseCase updateTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;

  String? validateTitle(String? title) {
    if (title == null || title.trim().isEmpty) {
      return "Please enter title";
    }
    return null;
  }

  String? validateDesc(String? desc) {
    if (desc == null || desc.trim().isEmpty) {
      return "Please enter description";
    }
    return null;
  }

  Future<void> onSave({required String title, required String desc}) async {
    emit(state.copyWith(apistate: APISTATE.loading));
    final req = AddTodoReq(
      createdAt: DateTime.now().toString(),
      description: desc.trim(),
      isCompleted: false,
      title: title.trim(),
      id: const Uuid().v1(),
    );

    final data = await addTodoUseCase.call(req);
    data.fold(
      (l) {
        emit(state.copyWith(apistate: APISTATE.error));
        CommonUtils.showErrorToast(l.message);
      },
      (r) {
        emit(state.copyWith(apistate: APISTATE.loaded));
        CommonUtils.showSuccessToast(r.message);
        goBack(arg: true);
      },
    );
  }

  Future<void> onUpdateTodo(AddTodoReq param) async {
    emit(state.copyWith(apistate: APISTATE.loading));
    final data = await updateTodoUseCase.call(param);
    data.fold(
      (l) {
        emit(state.copyWith(apistate: APISTATE.error));
        CommonUtils.showErrorToast(l.message);
      },
      (r) {
        emit(state.copyWith(apistate: APISTATE.loaded));
        CommonUtils.showSuccessToast(r.message);
        goBack(arg: true);
      },
    );
  }

  Future<void> onDeleteTodo(String id) async {
    emit(state.copyWith(apistate: APISTATE.loading));
    final data = await deleteTodoUseCase.call(id);
    data.fold(
      (l) {
        emit(state.copyWith(apistate: APISTATE.error));
        CommonUtils.showErrorToast(l.message);
      },
      (r) {
        emit(state.copyWith(apistate: APISTATE.loaded));
        CommonUtils.showSuccessToast(r.message);
        goBack(arg: true);
      },
    );
  }
}
