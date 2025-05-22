import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/profile_page.dart';
import '../presentation/project_info.dart';
import '../presentation/project_page.dart';
import 'routes.dart';

class WebRouter {
  WebRouter();

  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  late final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: <GoRoute>[
      GoRoute(
        name: Routes.home.name,
        path: Routes.home.path,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        name: Routes.project.name,
        path: Routes.project.path,
        builder: (context, state) => const ProjectPage(),
      ),
      GoRoute(
        name: Routes.projectDetail.name,
        path: Routes.projectDetail.path,
        builder: (context, state) =>
            ProjectInfoPage(projectTag: state.pathParameters['projectTag']!),
      ),
    ],
    redirect: _rootRedirectCheck,
  );

  FutureOr<String?> _rootRedirectCheck(
      BuildContext context, GoRouterState state) async {
    return null;
  }
}
