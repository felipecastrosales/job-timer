import 'package:isar/isar.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/view_models/project_task_model.dart';

class ProjectModel {
  factory ProjectModel.fromEntity(Project project) {
    project.tasks.loadSync();
    return ProjectModel(
      id: project.id,
      name: project.name,
      estimate: project.estimate,
      status: project.status,
      tasks: project.tasks.map(ProjectTaskModel.fromEntity).toList(),
    );
  }

  ProjectModel({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.estimate,
    required this.status,
    required this.tasks,
  });

  final Id? id;
  final String name;
  final int estimate;
  final ProjectStatus status;
  final List<ProjectTaskModel> tasks;
}
