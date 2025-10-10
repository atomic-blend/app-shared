// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_email.dart';

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
  static RegisterRoute _fromState(GoRouterState state) =>
      RegisterRoute(state.extra as RegisterParams?);

  RegisterRoute get _self => this as RegisterRoute;

  @override
  String get location => GoRouteData.$location('/auth/register');

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
