import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/services/projects/project_service.dart';

import 'package:job_timer/app/view_models/project_model.dart';

part 'project_detail_state.dart';

class ProjectDetailController extends Cubit<ProjectDetailState> {
  final ProjectService _projectService;

  ProjectDetailController({
    required ProjectService projectService,
  })  : _projectService = projectService,
        super(const ProjectDetailState.initial());

  void setProject(ProjectModel projectModel) {
    emit(
      state.copyWith(
        projectModel: projectModel,
        status: ProjectDetailStatus.complete,
      ),
    );
  }

  Future<void> updateProject() async {
    final project = await _projectService.findById(state.projectModel!.id!);
    emit(state.copyWith(
      projectModel: project,
      status: ProjectDetailStatus.complete,
    ));
  }

  Future<void> finishProject() async {
    try {
      emit(state.copyWith(status: ProjectDetailStatus.loading));
      final projectId = state.projectModel!.id!;
      await _projectService.finishProject(projectId);
      updateProject();
    } catch (e, s) {
      developer.log('Error to finish project', error: e, stackTrace: s);
      emit(state.copyWith(status: ProjectDetailStatus.failure));
    }
  }
}
