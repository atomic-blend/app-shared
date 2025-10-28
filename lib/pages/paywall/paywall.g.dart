// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paywall.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$paywallRoute];

RouteBase get $paywallRoute => GoRouteData.$route(
  path: '/paywall',
  name: 'paywall',

  factory: _$PaywallRoute._fromState,
);

mixin _$PaywallRoute on GoRouteData {
  static PaywallRoute _fromState(GoRouterState state) => PaywallRoute(
    success: state.uri.queryParameters['success'],
    cancelled: state.uri.queryParameters['cancelled'],
  );

  PaywallRoute get _self => this as PaywallRoute;

  @override
  String get location => GoRouteData.$location(
    '/paywall',
    queryParams: {
      if (_self.success != null) 'success': _self.success,
      if (_self.cancelled != null) 'cancelled': _self.cancelled,
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
