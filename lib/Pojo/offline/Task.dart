import 'package:hive/hive.dart';

part  'Task.g.dart';
@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late bool isCompleted;
}