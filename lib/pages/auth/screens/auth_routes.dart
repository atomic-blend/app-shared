import 'package:ab_shared/pages/auth/screens/login.dart' as login;
import 'package:ab_shared/pages/auth/screens/register_email.dart' as register;
import 'package:go_router/go_router.dart';

final List<RouteBase> $appRoutes = [
  ...login.$appRoutes,
  ...register.$appRoutes,
];
