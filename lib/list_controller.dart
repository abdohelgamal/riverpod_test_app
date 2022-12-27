import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_app/todo.dart';

class TodoListController extends StateNotifier<TodosAbstractState> {
  TodoListController() : super(TodoInitialState());

  List<Todo> todos = [];

  void addTodo() {
    todos = [...todos, Todo(Random().nextInt(1560131).toString())];
    state = AddedTodoState(todos); // equivelant to emit()
  }

  void removeTodo() {
    todos.removeLast();
    todos = [...todos]; // spread operator
    state = RemovedTodoState(todos);
  }
}

abstract class TodosAbstractState {}

class TodoInitialState extends TodosAbstractState {}

class AddedTodoState extends TodosAbstractState {
  AddedTodoState(this.listData);
  List<Todo> listData;
}

class RemovedTodoState extends TodosAbstractState {  RemovedTodoState(this.listData);
  List<Todo> listData;}
