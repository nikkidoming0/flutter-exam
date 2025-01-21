import 'package:flutter_exam/features/routes/routes.dart';
import 'package:flutter_exam/features/ui/login/login_ui.dart';
import 'package:flutter_exam/features/ui/socials/socials_ui.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {

  static final routers = GoRouter(
    initialLocation: Routes.login,
    routes: [
      //Login
      GoRoute(
        path: Routes.login,
        name: Routes.login,
        builder: (_, __) {
          return const LoginScreen();
        },
      ),
      //Socials
      GoRoute(
        path: Routes.socials,
        name: Routes.socials,
        builder: (_, __) {
          return const SocialsScreen();
        },
      ),
    ],
  );
}