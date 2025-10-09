// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sso_module.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$ssoModuleRoute];

RouteBase get $ssoModuleRoute =>
    GoRouteData.$route(path: '/sso', factory: _$SsoModuleRoute._fromState);

mixin _$SsoModuleRoute on GoRouteData {
  static SsoModuleRoute _fromState(GoRouterState state) =>
      SsoModuleRoute(state.extra as SsoModuleParams?);

  SsoModuleRoute get _self => this as SsoModuleRoute;

  @override
  String get location => GoRouteData.$location('/sso');

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
