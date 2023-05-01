import 'dart:developer' as developer;

import 'package:isar/isar.dart';

import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/exceptions/failure.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/entities/project_task.dart';

import 'project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  ProjectRepositoryImpl({
    required Database database,
  }) : _database = database;

  final Database _database;

  @override
  Future<void> register(Project project) async {
    try {
      final connection = await _database.openConnection();
      await connection.writeTxn(
        () => connection.projects.put(project),
      );
    } on IsarError catch (e, s) {
      developer.log('Error to sign project', error: e, stackTrace: s);
      throw Failure(message: 'Error to sign project');
    }
  }

  @override
  Future<List<Project>> findByStatus(ProjectStatus status) async {
    final connection = await _database.openConnection();
    final projects =
        await connection.projects.filter().statusEqualTo(status).findAll();
    return projects;
  }

  @override
  Future<Project> addTask(int projectId, ProjectTask task) async {
    final connection = await _database.openConnection();
    final project = await findById(projectId);
    project.tasks.add(task);
    await connection.writeTxn(() async {
      await connection.projectTasks.put(task);
      project.tasks.add(task);
      return project.tasks.save();
    });
    return project;
  }

  @override
  Future<Project> findById(int projectId) async {
    final connection = await _database.openConnection();
    final project = await connection.projects.get(projectId);
    if (project == null) {
      throw Failure(message: 'Project not find');
    }
    return project;
  }

  @override
  Future<void> finishProject(int projectId) async {
    try {
      final connection = await _database.openConnection();
      final project = await findById(projectId);
      project.status = ProjectStatus.finished;
      await connection.writeTxn(
        () => connection.projects.put(project),
      );
    } on IsarError catch (e, s) {
      developer.log(e.message, error: e, stackTrace: s);
      throw Failure(message: 'Error to finish project');
    }
  }
}
