import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_app/todo.dart';

class TodoListController extends StateNotifier<List<Todo>> {
  TodoListController() : super(List.empty());

  List<Todo> todos = [];

  void addTodo() {
    todos = [...todos, Todo(Random().nextInt(1560131).toString())];
    state = todos;
  }

  void removeTodo() {
    todos.removeLast();
    todos = [...todos];
    state = todos;
  }
}
