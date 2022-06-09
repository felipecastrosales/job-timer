import 'package:flutter/material.dart';

import 'package:job_timer/app/core/ui/job_timer_icons.dart';

import 'widgets/project_detail_appbar.dart';
import 'widgets/project_pie_chart.dart';
import 'widgets/project_task_tile.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProjectDetailAppbar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: ProjectPieChart(),
                ),
                const ProjectTaskTile(),
                const ProjectTaskTile(),
                const ProjectTaskTile(),
                const ProjectTaskTile(),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(JobTimerIcons.okCircled),
                  label: const Text('Finish Project'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
