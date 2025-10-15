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
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class MnemonicKey extends StatefulWidget {
  const MnemonicKey({
    super.key,
    required this.mnemonic,
    required this.onSuccess,
  });
  final String mnemonic;
  final VoidCallback onSuccess;
  @override
  State<MnemonicKey> createState() => _MnemonicKeyState();
}

class _MnemonicKeyState extends State<MnemonicKey>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final _animationDuration = const Duration(milliseconds: 250);
  final TextEditingController _mnemonicController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isConfirmStep = false;
  String? _mnemonic;

  @override
  initState() {
    _animationController = AnimationController(vsync: this);
    _mnemonic = widget.mnemonic;
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getTheme(context).surface,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {},
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: getSize(context).height * 0.1),
              Center(
                child: ElevatedContainer(
                  constraints: BoxConstraints(
                    minWidth: isDesktop(context) ? 500 : 200,
                  ),
                  color: getTheme(context).surface,
                  width:
                      isDesktop(context)
                          ? getSize(context).width * 0.2
                          : getSize(context).width * 0.9,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.md,
                      vertical: $constants.insets.lg,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Animate(
                                controller: _animationController,
                                effects: [
                                  FadeEffect(
                                    duration: _animationDuration,
                                    delay: const Duration(milliseconds: 0),
                                  ),
                                ],
                                onPlay: (controller) => controller.forward(),
                                child: Center(
                                  child: Lottie.asset(
                                    'assets/animations/computer_lock.json',
                                    fit: BoxFit.cover,
                                    width:
                                        isDesktop(context)
                                            ? getSize(context).width * 0.2
                                            : getSize(context).width * 0.4,
                                  ),
                                ),
                              ),
                              SizedBox(height: $constants.insets.md),
                              Animate(
                                controller: _animationController,
                                effects: [
                                  FadeEffect(
                                    duration: _animationDuration,
                                    delay: const Duration(milliseconds: 0),
                                  ),
                                ],
                                onPlay: (controller) => controller.forward(),
                                child: AutoSizeText(
                                  maxLines: 1,
                                  context.t.auth.mnemonic_key.title,
                                  textAlign: TextAlign.center,
                                  style: getTextTheme(context).displaySmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: $constants.insets.md),
                              Animate(
                                controller: _animationController,
                                effects: [
                                  FadeEffect(
                                    duration: _animationDuration,
                                    delay: const Duration(milliseconds: 300),
                                  ),
                                ],
                                onPlay: (controller) => controller.forward(),
                                child: SizedBox(
                                  width: getSize(context).width * 0.9,
                                  child: Text.rich(
                                    TextSpan(
                                      text:
                                          "${context.t.auth.mnemonic_key.description_start}\n",
                                      children: [
                                        TextSpan(
                                          text:
                                              '${context.t.auth.mnemonic_key.description_mid}\n\n',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              context
                                                  .t
                                                  .auth
                                                  .mnemonic_key
                                                  .description_end,
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                    style: getTextTheme(context).bodyMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: $constants.insets.sm),
                        SizedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: $constants.insets.md),
                              if (_isConfirmStep == false) ...[
                                SizedBox(
                                  width: getSize(context).width * 0.9,
                                  child: Animate(
                                    controller: _animationController,
                                    effects: [
                                      FadeEffect(
                                        duration: _animationDuration,
                                        delay: const Duration(
                                          milliseconds: 300,
                                        ),
                                      ),
                                    ],
                                    onPlay:
                                        (controller) => controller.forward(),
                                    child: GestureDetector(
                                      onTap: () {
                                        //copy to clipboard
                                        Clipboard.setData(
                                          ClipboardData(text: _mnemonic ?? ""),
                                        );
                                        ToastHelper.showSuccess(
                                          context: context,
                                          title:
                                              context
                                                  .t
                                                  .auth
                                                  .mnemonic_key
                                                  .copy_success,
                                          description: "",
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(
                                          $constants.insets.sm,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              getTheme(
                                                context,
                                              ).surfaceContainer,
                                          borderRadius: BorderRadius.circular(
                                            $constants.corners.md,
                                          ),
                                        ),
                                        child: Text(
                                          _mnemonic ?? "",
                                          style: getTextTheme(
                                            context,
                                          ).titleSmall!.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              if (_isConfirmStep == true) ...[
                                SizedBox(
                                  width: getSize(context).width * 0.9,
                                  child: Animate(
                                    controller: _animationController,
                                    effects: [
                                      FadeEffect(
                                        duration: _animationDuration,
                                        delay: const Duration(
                                          milliseconds: 300,
                                        ),
                                      ),
                                    ],
                                    onPlay:
                                        (controller) => controller.forward(),
                                    child: AppTextFormField(
                                      controller: _mnemonicController,
                                      hintText:
                                          context
                                              .t
                                              .auth
                                              .mnemonic_key
                                              .mnemonic_hint,
                                      obscureText: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return context
                                              .t
                                              .auth
                                              .mnemonic_key
                                              .mnemonic_error;
                                        }
                                        if (value != _mnemonic) {
                                          return context
                                              .t
                                              .auth
                                              .mnemonic_key
                                              .mnemonic_error;
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                              SizedBox(height: $constants.insets.xl),
                              Animate(
                                controller: _animationController,
                                effects: [
                                  FadeEffect(
                                    duration: _animationDuration,
                                    delay: const Duration(milliseconds: 300),
                                  ),
                                ],
                                onPlay: (controller) => controller.forward(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    PrimaryButtonSquare(
                                      text: context.t.actions.next,
                                      backgroundColor:
                                          getTheme(context).primary,
                                      onPressed: () async {
                                        if (_isConfirmStep == false) {
                                          setState(() {
                                            _isConfirmStep = true;
                                          });
                                          return;
                                        }
                                        if (_mnemonicController.text.isEmpty) {
                                          return;
                                        }
                                        if (!_formKey.currentState!
                                            .validate()) {
                                          return;
                                        }
                                        _animationController.reverseDuration =
                                            const Duration(milliseconds: 500);
                                        await _animationController.reverse(
                                          from: 1.0,
                                        );

                                        if (!context.mounted) return;
                                        widget.onSuccess();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
