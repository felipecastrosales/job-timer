import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:job_timer/app/core/ui/job_timer_icons.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/view_models/project_model.dart';

import 'controller/project_detail_controller.dart';
import 'widgets/project_detail_appbar.dart';
import 'widgets/project_pie_chart.dart';
import 'widgets/project_task_tile.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectDetailController controller;
  const ProjectDetailPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProjectDetailController, ProjectDetailState>(
        bloc: controller,
        listener: (context, state) {
          if (state.status == ProjectDetailStatus.failure) {
            AsukaSnackbar.alert('Internal error');
          }
        },
        builder: (context, state) {
          final projectModel = state.projectModel;
          switch (state.status) {
            case ProjectDetailStatus.initial:
              return const Center(
                child: Text('Loading Project'),
              );
            case ProjectDetailStatus.loading:
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case ProjectDetailStatus.complete:
              return _buildProjectDetail(context, projectModel!);
            case ProjectDetailStatus.failure:
              if (projectModel != null) {
                return _buildProjectDetail(context, projectModel);
              }
              return const Center(
                child: Text('Error to loading project'),
              );
          }
        },
      ),
    );
  }

  Widget _buildProjectDetail(
    BuildContext context,
    ProjectModel projectModel,
  ) {
    final totalTasks = projectModel.tasks.fold<int>(0, (totalValue, task) {
      return totalValue += task.duration;
    });

    return CustomScrollView(
      slivers: [
        ProjectDetailAppbar(projectModel: projectModel),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: ProjectPieChart(
                  projectEstimate: projectModel.estimate,
                  totalTask: totalTasks,
                ),
              ),
              ...projectModel.tasks
                  .map((task) => ProjectTaskTile(task: task))
                  .toList(),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Visibility(
                visible: projectModel.status != ProjectStatus.finished,
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.finishProject();
                  },
                  icon: const Icon(JobTimerIcons.okCircled),
                  label: const Text('Finish Project'),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
