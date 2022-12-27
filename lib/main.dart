import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_app/list_controller.dart';
import 'package:riverpod_test_app/todo.dart';

final controller = StateNotifierProvider<TodoListController, List<Todo>>(
    (ref) => TodoListController());

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(appBar: AppBar(), body: const ScaffoldBody()),
      ),
    );
  }
}

class ScaffoldBody extends ConsumerWidget {
  const ScaffoldBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listController = ref.watch(controller);
    return Column(
      children: [
        MaterialButton(
            color: Colors.green,
            minWidth: MediaQuery.of(context).size.width * 0.5,
            onPressed: () {
              ref.read(controller.notifier).addTodo();
            },
            child: const Text('add')),
        Text(
          listController.length.toString(),
        ),
        MaterialButton(
            color: Colors.red,
            minWidth: MediaQuery.of(context).size.width * 0.5,
            onPressed: () {
              ref.read(controller.notifier).removeTodo();
            },
            child: const Text('remove')),
      ],
    );
  }
}
