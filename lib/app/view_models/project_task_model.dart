import 'package:isar/isar.dart';
import 'package:job_timer/app/entities/project_task.dart';

@collection
class ProjectTaskModel {
  factory ProjectTaskModel.fromEntity(ProjectTask task) {
    return ProjectTaskModel(
      id: task.id,
      name: task.name,
      duration: task.duration,
    );
  }

  ProjectTaskModel({
    this.id,
    required this.name,
    required this.duration,
  });

  Id? id = Isar.autoIncrement;
  String name;
  int duration;
}
