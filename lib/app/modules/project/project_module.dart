import 'package:flutter_modular/flutter_modular.dart';

import 'package:job_timer/app/modules/project/register/project_register_module.dart';

class ProjectModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/register',
          module: ProjectRegisterModule(),
        ),
      ];
}
