import 'package:go_firebase/routing/routes/auth_routes.dart';
import 'package:go_firebase/routing/routes/home_routes.dart';

export 'routes/auth_routes.dart' hide $appRoutes;
export 'routes/home_routes.dart' hide $appRoutes;

final appRoutes = [
  $authPageData,
  $homeRouteData,
];