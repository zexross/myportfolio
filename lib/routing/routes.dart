class Route {
  const Route(this.name, this.path);

  final String name;
  final String path;
}

class Routes {
  static const home = Route(
    'home',
    '/',
  );
  static const project = Route(
    'project',
    '/project',
  );
  static const projectDetail = Route(
    'projectDetail',
    '/project/:projectTag',
  );
}
