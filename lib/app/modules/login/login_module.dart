import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'controller/login_controller.dart';
import 'login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        BlocBind.lazySingleton(
          (i) => LoginController(
            authService: i(), // AuthService - AppModule
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => LoginPage(
            controller: Modular.get(),
          ),
        ),
      ];
}
