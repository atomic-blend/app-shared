import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:ab_shared/utils/toast_helper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:icons_plus/icons_plus.dart';

class RegisterEmail extends StatefulWidget {
  const RegisterEmail({
    super.key,
    this.cancelCallback,
    required this.nextStepCallback,
    this.username,
    this.domain,
  });
  final String? username;
  final String? domain;
  final VoidCallback? cancelCallback;
  final Function(String) nextStepCallback;

  @override
  State<RegisterEmail> createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final _animationDuration = const Duration(milliseconds: 250);
  final TextEditingController _usernameController = TextEditingController();
  String? domain;

  @override
  initState() {
    _usernameController.text = widget.username ?? '';
    domain = widget.domain;
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        if (state is LoggedIn) {
          if (!context.mounted) return;
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          if (authState.appConfig == null) {
            Navigator.pop(context);
            ToastHelper.showError(
              context: context,
              title: "Cannot get the app config from the server",
              description: "Please try again later",
            );
            return const SizedBox.shrink();
          }
          return Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: getSize(context).height * 0.08),
                  Animate(
                    controller: _animationController,
                    effects: [
                      FadeEffect(
                        duration: _animationDuration,
                        delay: const Duration(milliseconds: 0),
                      ),
                    ],
                    onPlay: (controller) => controller.forward(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.md,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/authentication.png',
                              fit: BoxFit.cover,
                              width:
                                  isDesktop(context)
                                      ? getSize(context).width * 0.2
                                      : getSize(context).width * 0.5,
                            ),
                          ),
                          AutoSizeText(
                            maxLines: 1,
                            context.t.auth.register.email,
                            style: getTextTheme(context).displaySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: $constants.insets.xs),
                          SizedBox(
                            width: getSize(context).width * 0.9,
                            child: Text(
                              context.t.auth.register.email_description,
                            ),
                          ),
                          SizedBox(
                            width: getSize(context).width * 0.9,
                            child: Text(
                              context.t.auth.register.we_never_sell,
                              style: getTextTheme(context).bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: $constants.insets.xs),
                          Animate(
                            controller: _animationController,
                            effects: [
                              FadeEffect(
                                duration: _animationDuration,
                                delay: const Duration(milliseconds: 300),
                              ),
                            ],
                            onPlay: (controller) => controller.forward(),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: getSize(context).width * 0.4,
                                  child: ElevatedContainer(
                                    child: AppTextFormField(
                                      controller: _usernameController,
                                      hintText: context.t.auth.login.username,
                                    ),
                                  ),
                                ),
                                SizedBox(width: $constants.insets.xs),
                                Expanded(
                                  child: CustomPopup(
                                    content: SizedBox(
                                      width: getSize(context).width * 0.45,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Please select a domain",
                                            style: getTextTheme(
                                              context,
                                            ).headlineSmall!.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: $constants.insets.sm,
                                          ),
                                          SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                ...authState.appConfig!.domains
                                                    .map(
                                                      (e) => Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                              bottom:
                                                                  $constants
                                                                      .insets
                                                                      .sm,
                                                            ),
                                                        child:
                                                            ElevatedContainer(
                                                              onTap: () {
                                                                setState(() {
                                                                  domain = e;
                                                                });
                                                                Navigator.pop(
                                                                  context,
                                                                );
                                                              },
                                                              color:
                                                                  getTheme(
                                                                    context,
                                                                  ).surface,
                                                              width:
                                                                  double
                                                                      .infinity,
                                                              height: 45,
                                                              child: Center(
                                                                child: Text(e),
                                                              ),
                                                            ),
                                                      ),
                                                    ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    child: ElevatedContainer(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: $constants.insets.sm,
                                      ),
                                      height: 45,
                                      // width: getSize(context).width * 0.45,
                                      child: Row(
                                        children: [
                                          if (domain == null || domain!.isEmpty)
                                            Row(
                                              children: [
                                                Text("@"),
                                                SizedBox(
                                                  width: $constants.insets.md,
                                                ),
                                                Text(
                                                  "Please select a domain",
                                                  style: getTextTheme(
                                                    context,
                                                  ).bodySmall!.copyWith(
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ],
                                            )
                                          else
                                            Text("@${domain!}"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: $constants.insets.sm),
                  const Spacer(),
                  const Divider(),
                  Animate(
                    controller: _animationController,
                    effects: [
                      FadeEffect(
                        duration: _animationDuration,
                        delay: const Duration(milliseconds: 500),
                      ),
                    ],
                    onPlay: (controller) => controller.forward(),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: $constants.insets.md,
                      ),
                      height: getSize(context).height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Spacer(),
                          PrimaryButtonSquare(
                            text: context.t.actions.next,
                            backgroundColor: getTheme(context).primary,
                            onPressed: () async {
                              if (_usernameController.text.isEmpty) {
                                return;
                              }
                              _animationController.reverseDuration =
                                  const Duration(milliseconds: 500);
                              await _animationController.reverse(from: 1.0);
                              widget.nextStepCallback(
                                "${_usernameController.text}@${domain!}",
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height:
                        !isDesktop(context)
                            ? $constants.insets.sm
                            : $constants.insets.xs,
                  ),
                ],
              ),
              Positioned(
                left: $constants.insets.sm,
                top: $constants.insets.md,
                child: GestureDetector(
                  onTap: widget.cancelCallback,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(OctIcons.arrow_left, size: 18),
                      SizedBox(width: $constants.insets.xxs),
                      Text(
                        context.t.actions.back,
                        style: getTextTheme(
                          context,
                        ).bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
