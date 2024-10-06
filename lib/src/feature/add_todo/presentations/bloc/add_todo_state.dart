part of 'add_todo_cubit.dart';

class AddTodoState extends Equatable {
  final APISTATE apistate;

  const AddTodoState({this.apistate = APISTATE.idle});

  AddTodoState copyWith({final APISTATE? apistate}) {
    return AddTodoState(apistate: apistate ?? this.apistate);
  }

  @override
  List<Object?> get props => [apistate];
}
