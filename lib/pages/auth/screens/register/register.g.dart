// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$registerRoute];

RouteBase get $registerRoute => GoRouteData.$route(
  path: '/auth/register',
  name: 'register',

  factory: _$RegisterRoute._fromState,
);

mixin _$RegisterRoute on GoRouteData {
  static RegisterRoute _fromState(GoRouterState state) => RegisterRoute(
    state.uri.queryParameters['email'],
    state.uri.queryParameters['security-key'],
    state.extra as RegisterParams?,
  );

  RegisterRoute get _self => this as RegisterRoute;

  @override
  String get location => GoRouteData.$location(
    '/auth/register',
    queryParams: {
      if (_self.email != null) 'email': _self.email,
      if (_self.securityKey != null) 'security-key': _self.securityKey,
    },
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}
