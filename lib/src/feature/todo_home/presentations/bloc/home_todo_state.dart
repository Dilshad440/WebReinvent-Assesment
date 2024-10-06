part of 'home_todo_cubit.dart';

class HomeTodoState extends Equatable {
  APISTATE apistate;
  List<TodoResponse>? todos;

  HomeTodoState({this.apistate = APISTATE.idle, this.todos});

  HomeTodoState copyWith({
    final APISTATE? apistate,
    final List<TodoResponse>? todos,
  }) {
    return HomeTodoState(
      apistate: apistate ?? this.apistate,
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object?> get props => [
        apistate,
        todos,
      ];
}
