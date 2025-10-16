// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$resetPasswordRoute];

RouteBase get $resetPasswordRoute => GoRouteData.$route(
  path: '/auth/reset-password',
  name: 'reset-password',

  factory: _$ResetPasswordRoute._fromState,
);

mixin _$ResetPasswordRoute on GoRouteData {
  static ResetPasswordRoute _fromState(GoRouterState state) =>
      ResetPasswordRoute(state.extra as ResetPasswordParams?);

  ResetPasswordRoute get _self => this as ResetPasswordRoute;

  @override
  String get location => GoRouteData.$location('/auth/reset-password');

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
