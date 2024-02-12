import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dreambiztech/Pojo/offline/Task.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'task_event.dart';
part 'task_state.dart';



class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final Box<Task> taskBox = Hive.box<Task>('tasks');

  TaskBloc() : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(
      TaskEvent event,
      ) async* {
    if (event is LoadTasks) {
      yield* _mapLoadTasksToState();
    } else if (event is AddTask) {
      yield* _mapAddTaskToState(event.task);
    } else if (event is UpdateTask) {
      yield* _mapUpdateTaskToState(event.task);
    } else if (event is DeleteTask) {
      yield* _mapDeleteTaskToState(event.task);
    }
  }

  Stream<TaskState> _mapLoadTasksToState() async* {
    try {
      final tasks = taskBox.values.toList();
      yield TasksLoaded(tasks);
    } catch (e) {
      // Handle error
      yield TaskError("Error loading tasks");
    }
  }

  Stream<TaskState> _mapAddTaskToState(Task task) async* {
    try {
      taskBox.add(task);
      final tasks = taskBox.values.toList();
      yield TasksLoaded(tasks);
    } catch (e) {
      // Handle error
      yield TaskError("Error adding task");
    }
  }

  Stream<TaskState> _mapUpdateTaskToState(Task task) async* {
    try {
      task.save();
      final tasks = taskBox.values.toList();
      yield TasksLoaded(tasks);
    } catch (e) {
      // Handle error
      yield TaskError("Error updating task");
    }
  }

  Stream<TaskState> _mapDeleteTaskToState(Task task) async* {
    try {
      task.delete();
      final tasks = taskBox.values.toList();
      yield TasksLoaded(tasks);
    } catch (e) {
      // Handle error
      yield TaskError("Error deleting task");
    }
  }
}
