import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/icon_text_button.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/pages/settings/screens/app_settings.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings.g.dart';

class SettingsParams {
  final List<Widget>? additionalSettings;
  const SettingsParams({
    this.additionalSettings,
  });
}

@TypedGoRoute<SettingsRoute>(path: "/settings", name: "settings")
class SettingsRoute extends GoRouteData with _$SettingsRoute {
  final SettingsParams? $extra;
  SettingsRoute(this.$extra);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Settings(
      additionalSettings: $extra?.additionalSettings,
    );
  }
}

class Settings extends StatefulWidget {
  final getIt = GetIt.instance;
  late final SharedPreferences? prefs;
  late final ApiClient? globalApiClient;
  final  List<Widget>? additionalSettings;
  Settings({
    super.key,
    this.additionalSettings,
  }) {
    prefs = getIt<SharedPreferences>();
    globalApiClient = getIt<ApiClient>();
  }

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Widget? selectedItem;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.prefs == null || widget.globalApiClient == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/');
      });
    }
    if (isDesktop(context) && selectedItem == null) {
      selectedItem = AppSettings(
        prefs: widget.prefs,
        globalApiClient: widget.globalApiClient,
      );
    }
    return Row(
      children: [
        SizedBox(
          width: isDesktop(context) ? 300 : getSize(context).width,
          child: Scaffold(
            body: BlocBuilder<AuthBloc, AuthState>(
              builder: (contex, authState) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: $constants.insets.sm,
                    vertical: $constants.insets.xs,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: $constants.insets.xs,
                      horizontal: $constants.insets.xxs,
                    ),
                    child: Column(
                      spacing: $constants.insets.md,
                      children: [
                        IconTextButton(
                          text: context.t.settings.app_settings.title,
                          icon: CupertinoIcons.device_phone_portrait,
                          iconSize: 20,
                          onTap: () {
                            if (isDesktop(context)) {
                              setState(() {
                                selectedItem = AppSettings(
                                  prefs: widget.prefs,
                                  globalApiClient: widget.globalApiClient,
                                );
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AppSettings(
                                      prefs: widget.prefs,
                                      globalApiClient: widget.globalApiClient,
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        ),
                        if (widget.additionalSettings != null) ...[
                          ...widget.additionalSettings ?? [],
                        ],
                        if (authState is LoggedIn)
                          IconTextButton(
                            text: context.t.settings.logout,
                            icon: CupertinoIcons.multiply_circle_fill,
                            iconSize: 20,
                            iconColor: Colors.red,
                            textColor: Colors.red,
                            onTap: () {
                              context.read<AuthBloc>().add(const Logout());
                              Navigator.pop(context);
                            },
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        if (isDesktop(context)) ...[
          VerticalDivider(
            color: getTheme(context).surfaceContainer,
            thickness: 1,
          ),
          Expanded(child: selectedItem ?? Container()),
        ],
      ],
    );
  }
}
