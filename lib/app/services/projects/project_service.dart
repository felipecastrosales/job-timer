import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/view_models/project_model.dart';

abstract class ProjectService {
  Future<void> register(ProjectModel project);
  Future<List<ProjectModel>> findByStatus(ProjectStatus status);
}
