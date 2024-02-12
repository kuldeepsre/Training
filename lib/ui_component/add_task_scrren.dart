// AddTaskScreen.dart
import 'package:dreambiztech/Pojo/offline/Task.dart';
import 'package:dreambiztech/bloc/task/task_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state is TaskAdded) {
          // Handle any additional actions when a task is added (e.g., show a success message)
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Task added successfully!'),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Task'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Task Title'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  final title = _titleController.text;
                  if (title.isNotEmpty) {
                    final newTask = Task()..title = title;
                    BlocProvider.of<TaskBloc>(context).add(AddTask(newTask));
                  }
                },
                child: const Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
