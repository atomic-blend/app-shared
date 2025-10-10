import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/ab_toast.dart';
import 'package:ab_shared/components/app/ab_navbar.dart';
import 'package:ab_shared/components/app/ab_sidemenu.dart';
import 'package:ab_shared/pages/auth/screens/login.dart';
import 'package:ab_shared/services/device_info.service.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/env/env.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLayout extends StatelessWidget {
  final getIt = GetIt.instance;
  final List<NavigationItem> items;
  final EncryptionService? encryptionService;
  final ApiClient? globalApiClient;
  final SharedPreferences? prefs;
  final EnvModel? env;
  final Widget child;
  final String homeRouteLocation;
  AppLayout({
    super.key,
    required this.items,
    this.encryptionService,
    this.globalApiClient,
    this.env,
    this.prefs,
    required this.child,
    required this.homeRouteLocation,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is! LoggedIn) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            LoginRoute(
              LoginParams(
                homeRouteLocation: homeRouteLocation,
              ),
            ).go(context);
          });
        }
        if (authState.user != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            authState.user?.devices ??= [];
            final deviceInfoService = DeviceInfoService();
            final userDeviceInfo = await deviceInfoService.getDeviceInfo();

            if (!context.mounted) return;
            // ignore: use_build_context_synchronously
            context.read<AuthBloc>().add(
              UpdateUserDevice(
                // ignore: use_build_context_synchronously
                authState.user!,
                userDeviceInfo,
              ),
            );
          });
        }
        return isDesktop(context)
            ? _buildDesktop(context)
            : _buildMobile(context);
      },
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            if (isDesktop(context))
              SizedBox(
                width: 250,
                child: ABSideMenu(
                  controller: getIt<SideMenuController>(),
                  primaryMenuItems: items,
                ),
              ),
            Expanded(child: child),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: $constants.insets.sm,
              right: $constants.insets.sm,
            ),
            child: ABToastDisplay(controller: getIt<ABToastController>()),
          ),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(GoRouter.of(context).state.name ?? '')),
      drawer: ABSideMenu(
        controller: getIt<SideMenuController>(),
        primaryMenuItems: items,
      ),
      body: Stack(
        children: [
          child,
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: ABToastDisplay(controller: getIt<ABToastController>()),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
              child: ABNavbar(
                backgroundColor: getTheme(context).surface,
                destinations: items,
                primaryMenuKey: GoRouter.of(context).state.path ?? '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
