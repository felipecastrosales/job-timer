part of 'project_detail_controller.dart';

enum ProjectDetailStatus { initial, loading, complete, failure }

class ProjectDetailState extends Equatable {

  const ProjectDetailState.initial()
      : this._(status: ProjectDetailStatus.initial);

  const ProjectDetailState._({
    required this.status,
    this.projectModel,
  });
  final ProjectDetailStatus status;
  final ProjectModel? projectModel;

  ProjectDetailState copyWith({
    ProjectDetailStatus? status,
    ProjectModel? projectModel,
  }) {
    return ProjectDetailState._(
      status: status ?? this.status,
      projectModel: projectModel ?? this.projectModel,
    );
  }

  @override
  List<Object?> get props => [status, projectModel];
}
