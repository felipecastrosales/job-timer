import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';

import 'widgets/header_projects_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SafeArea(
          child: ListTile(
            title: Text('Exit'),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              title: Text('Projects'),
              expandedHeight: 100,
              toolbarHeight: 100,
              centerTitle: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: HeaderProjectsMenu(),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(height: 200, color: Colors.blue),
                  Container(height: 200, color: Colors.red),
                  Container(height: 200, color: Colors.green),
                  Container(height: 200, color: Colors.pink),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
