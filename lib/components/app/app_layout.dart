import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/ab_toast.dart';
import 'package:ab_shared/components/app/ab_navbar.dart';
import 'package:ab_shared/components/app/ab_sidemenu.dart';
import 'package:ab_shared/pages/auth/screens/login.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/env/env.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLayout extends StatelessWidget {
  final List<NavigationItem> items;
  final SideMenuController sideMenuController;
  final ABToastController abToastController;
  final EncryptionService? encryptionService;
  final ApiClient? globalApiClient;
  final SharedPreferences? prefs;
  final EnvModel? env;
  final Widget child;
  final String homeRouteLocation;
  const AppLayout({
    super.key,
    required this.items,
    required this.sideMenuController,
    this.encryptionService,
    this.globalApiClient,
    this.env,
    this.prefs,
    required this.child,
    required this.homeRouteLocation,
    required this.abToastController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is! LoggedIn) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            LoginRoute(
              LoginParams(
                onAuthSuccess: () {
                  context.go(homeRouteLocation);
                },
                env: env,
                encryptionService: encryptionService,
                globalApiClient: globalApiClient,
                prefs: prefs,
              ),
            ).go(context);
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
                  controller: sideMenuController,
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
            child: ABToastDisplay(controller: abToastController),
          ),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(GoRouter.of(context).state.name ?? '')),
      drawer: ABSideMenu(
        controller: sideMenuController,
        primaryMenuItems: items,
      ),
      body: Stack(
        children: [
          child,
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: ABToastDisplay(controller: abToastController),
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
                //TODO: make the center action work again
                centerActionEnabled: false,
                centerActionIcon: null,
                centerActionCallback: null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
