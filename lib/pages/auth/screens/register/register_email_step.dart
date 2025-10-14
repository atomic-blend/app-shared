import 'package:ab_shared/blocs/auth/auth.bloc.dart';
import 'package:ab_shared/components/buttons/primary_button_square.dart';
import 'package:ab_shared/components/forms/app_text_form_field.dart';
import 'package:ab_shared/i18n/strings.g.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';

class RegisterEmailStep extends StatefulWidget {
  final String? username;
  final String? domain;
  final String? password;
  final Function(String email, String password) onSuccess;
  const RegisterEmailStep({
    super.key,
    required this.onSuccess,
    this.username,
    this.domain,
    this.password,
  });

  @override
  State<RegisterEmailStep> createState() => _RegisterEmailStepState();
}

class _RegisterEmailStepState extends State<RegisterEmailStep>
    with SingleTickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? errorMessage;
  String? domain;

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.username ?? '';
    domain = widget.domain;
    _passwordController.text = widget.password ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return Container(
          constraints: BoxConstraints(minWidth: isDesktop(context) ? 500 : 200),
          width:
              isDesktop(context)
                  ? getSize(context).width * 0.2
                  : getSize(context).width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: $constants.insets.md),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width:
                          isDesktop(context)
                              ? 240
                              : getSize(context).width * 0.4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: getTheme(context).surfaceContainer,

                          borderRadius: BorderRadius.circular(
                            $constants.insets.sm,
                          ),
                        ),
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
                                style: getTextTheme(context).headlineSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: $constants.insets.sm),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    if (authState.appConfig != null)
                                      ...authState.appConfig!.domains.map(
                                        (e) => Padding(
                                          padding: EdgeInsets.only(
                                            bottom: $constants.insets.sm,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                domain = e;
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    getTheme(
                                                      context,
                                                    ).surfaceContainer,

                                                borderRadius:
                                                    BorderRadius.circular(
                                                      $constants.insets.sm,
                                                    ),
                                              ),
                                              width: double.infinity,
                                              height: 45,
                                              child: Center(child: Text(e)),
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
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: $constants.insets.sm,
                          ),
                          decoration: BoxDecoration(
                            color: getTheme(context).surfaceContainer,

                            borderRadius: BorderRadius.circular(
                              $constants.insets.sm,
                            ),
                          ),
                          height: 45,
                          width: getSize(context).width * 0.45,
                          child: Row(
                            children: [
                              if (domain == null || domain!.isEmpty)
                                Row(
                                  children: [
                                    Text("@"),
                                    SizedBox(width: $constants.insets.md),
                                    SizedBox(
                                      width: 80,
                                      child: AutoSizeText(
                                        maxLines: 1,

                                        "Please select a domain",
                                        style: getTextTheme(context).bodySmall!
                                            .copyWith(color: Colors.grey[700]),
                                        overflow: TextOverflow.ellipsis,
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
                if (authState.appConfig == null) ...[
                  SizedBox(height: $constants.insets.xs),
                  Text(
                    "Cannot get the app config from the server",
                    style: getTextTheme(
                      context,
                    ).bodySmall!.copyWith(color: Colors.red),
                  ),
                  Text(
                    "Please try again later",
                    style: getTextTheme(
                      context,
                    ).bodySmall!.copyWith(color: Colors.red),
                  ),
                ],
                SizedBox(height: $constants.insets.xs),
                SizedBox(
                  width: getSize(context).width * 0.9,
                  child: AppTextFormField(
                    controller: _passwordController,
                    hintText: context.t.auth.register.password_hint,
                    obscureText: true,
                  ),
                ),
                if (errorMessage != null &&
                    context.t.errors[errorMessage] != null) ...[
                  SizedBox(height: $constants.insets.xs),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.lg,
                    ),
                    child: SizedBox(
                      width: getSize(context).width * 0.9,
                      child: Text(
                        context.t.errors[errorMessage]!,
                        style: getTextTheme(
                          context,
                        ).labelSmall!.copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: $constants.insets.sm),
                ],
                if (errorMessage == null)
                  SizedBox(height: $constants.insets.md),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PrimaryButtonSquare(
                      text: context.t.auth.login_or_register.next,
                      backgroundColor: getTheme(context).primary,
                      onPressed: () async {
                        if (_usernameController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          if (!context.mounted) return;
                          widget.onSuccess(
                            "${_usernameController.text}@${domain!}",
                            _passwordController.text,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
