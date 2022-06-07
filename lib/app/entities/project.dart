import 'package:isar/isar.dart';
import 'converters/project_status_converter.dart';
import 'project_status.dart';
import 'project_task.dart';

part 'project.g.dart';

@Collection()
class Project {
  @Id()
  int? id;
  late String name;
  late int estimate;
  @ProjectStatusConverter()
  late ProjectStatus status;
  final tasks = IsarLinks<ProjectTask>();
}
