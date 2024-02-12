import 'package:dreambiztech/Pojo/offline/Task.dart';
import 'package:dreambiztech/bloc/task/task_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index].title),
          subtitle: Text(tasks[index].isCompleted ? 'Completed' : 'Incomplete'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              BlocProvider.of<TaskBloc>(context).add(DeleteTask(tasks[index]));
            },
          ),
        );
      },
    );
  }
}