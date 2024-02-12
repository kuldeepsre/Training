// task_state.dart
part of 'task_bloc.dart';

@immutable
abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskInitial extends TaskState {
  @override
  List<Object> get props => [];
}

class TasksLoaded extends TaskState {
  final List<Task> tasks;

  TasksLoaded(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class TaskError extends TaskState {
  final String message;

  TaskError(this.message);

  @override
  List<Object> get props => [message];
}

class TaskAdded extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskUpdated extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskDeleted extends TaskState {
  @override
  List<Object> get props => [];
}
