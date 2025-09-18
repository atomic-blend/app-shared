import 'dart:async';

import 'package:ab_shared/entities/config/ab_config.dart';
import 'package:ab_shared/entities/user/user.entity.dart';
import 'package:ab_shared/entities/user_device/user_device.dart';
import 'package:ab_shared/services/device_info.service.dart';
import 'package:ab_shared/services/encryption.service.dart';
import 'package:ab_shared/services/user.service.dart';
import 'package:ab_shared/utils/api_client.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth.event.dart';
part 'auth.state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  late UserService _userService;

  AuthBloc({
    required SharedPreferences prefs,
    required VoidCallback onLogout,
    required Function(EncryptionService) onLogin,
    required ApiClient globalApiClient,
    required EncryptionService? encryptionService,
  }) : super(const LoggedOut(null, null)) {
    final deviceInfoService = DeviceInfoService();
    _userService = UserService(
      prefs: prefs,
      deviceInfoService: deviceInfoService,
      onLogout: onLogout,
      onLogin: onLogin,
      globalApiClient: globalApiClient,
      encryptionService: encryptionService,
    );
    on<LoginEvent>(_onLogIn);
    on<Logout>(_onLogOut);
    on<RegisterEvent>(_onRegister);
    on<RefreshUser>(_onRefreshUser);
    on<DeleteUser>(_onDeleteUser);
    on<UpdateUserDevice>(_onUpdateUserDevice);
    on<UpdateUserProfile>(_onUpdateUserProfile);
    on<ChangePassword>(_onChangePassword);
    on<StartResetPassword>(_onStartResetPassword);
    on<ConfirmResetPassword>(_onConfirmResetPassword);
    on<GetBackupKeyForResetPassword>(_onGetBackupKeyForPasswordReset);
  }

  void _onLogOut(Logout event, Emitter<AuthState> emit) async {
    await _userService.logOut();
    emit(const LoggedOut(null, null));
  }

  void _onLogIn(LoginEvent event, Emitter<AuthState> emit) async {
    final prevState = state;
    emit(Loading(prevState.user, prevState.appConfig));
    try {
      final updatedUser = await _userService.login(event.email, event.password);
      if (updatedUser == null) {
        emit(const LoggedOut(null, null));
        return;
      }
      emit(LoggedIn(updatedUser, false, prevState.appConfig));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      if (e.response?.statusCode == 401) {
        emit(
          AuthError(
            "wrong_email_password",
            prevState.user,
            prevState.appConfig,
          ),
        );
      } else if (e.response?.statusCode == 400) {
        emit(AuthError("email_malformed", prevState.user, prevState.appConfig));
      }
    }
  }

  void _onRefreshUser(RefreshUser event, Emitter<AuthState> emit) async {
    final prevState = state;
    if (state.user == null) {
      emit(LoggedOut(prevState.user, prevState.appConfig));
      return;
    }
    final user = state.user!;
    final updatedUser = await _userService.getUser(user);
    if (updatedUser == null) {
      return;
    }
    emit(LoggedIn(updatedUser, false, prevState.appConfig));
  }

  void _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    final prevState = state;
    emit(Loading(prevState.user, prevState.appConfig));
    final updatedUser = await _userService.register(
      event.email,
      event.password,
    );
    if (updatedUser == null) {
      emit(LoggedOut(prevState.user, prevState.appConfig));
      return;
    }
    emit(LoggedIn(updatedUser, true, prevState.appConfig));
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      return LoggedIn(
        UserEntity.fromJson(json['user']),
        false,
        ABConfig.fromJson(json['appConfig']),
      );
    }
    return const LoggedOut(null, null);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return {
      'user': state.user?.toJson(),
      'appConfig': state.appConfig?.toJson(),
    };
  }

  void _onDeleteUser(DeleteUser event, Emitter<AuthState> emit) async {
    final prevState = state;
    emit(UserDeleting(prevState.user, prevState.appConfig));
    await _userService.deleteUser();
    emit(UserDeleted(prevState.user, prevState.appConfig));
  }

  void _onUpdateUserDevice(
    UpdateUserDevice event,
    Emitter<AuthState> emit,
  ) async {
    final prevState = state;
    if (state.user == null) {
      emit(LoggedOut(prevState.user, prevState.appConfig));
      return;
    }
    final user = state.user!;
    final updatedUser = await _userService.updateUserDevice(
      user,
      event.deviceInfo,
    );
    emit(LoggedIn(updatedUser, false, prevState.appConfig));
  }

  FutureOr<void> _onUpdateUserProfile(
    UpdateUserProfile event,
    Emitter<AuthState> emit,
  ) async {
    final prevState = state;
    if (state.user == null) {
      emit(LoggedOut(prevState.user, prevState.appConfig));
    }
    emit(UserUpdateProfileLoading(prevState.user, prevState.appConfig));
    final user = prevState.user!;
    final updatedUser = await _userService.updateUserProfile(
      user.id!,
      event.user,
    );
    emit(UserUpdateProfileSuccess(updatedUser, prevState.appConfig));
    emit(LoggedIn(updatedUser, false, prevState.appConfig));
  }

  FutureOr<void> _onChangePassword(
    ChangePassword event,
    Emitter<AuthState> emit,
  ) async {
    final prevState = state;
    if (state.user == null) {
      emit(LoggedOut(prevState.user, prevState.appConfig));
      return;
    }
    final user = state.user!;
    emit(UserChangePasswordLoading(prevState.user, prevState.appConfig));
    await _userService.changePassword(
      oldPassword: event.oldPassword,
      newPassword: event.newPassword,
      newEncryptedDataKey: event.newEncryptedDataKey,
      newUserKey: event.newUserKey,
      newUserSalt: event.newSalt,
    );
    emit(UserChangePasswordSuccess(user, prevState.appConfig));
    add(const RefreshUser());
  }

  FutureOr<void> _onStartResetPassword(
    StartResetPassword event,
    Emitter<AuthState> emit,
  ) async {
    final prevState = state;
    emit(StartResetPasswordLoading(prevState.user, prevState.appConfig));
    try {
      await _userService.startResetPassword(event.email);
    } on Exception catch (e) {
      emit(
        StartResetPasswordError(
          e.toString(),
          prevState.user,
          prevState.appConfig,
        ),
      );
    }
    emit(StartResetPasswordSuccess(prevState.user, prevState.appConfig));
  }

  FutureOr<void> _onConfirmResetPassword(
    ConfirmResetPassword event,
    Emitter<AuthState> emit,
  ) async {
    final prevState = state;
    emit(ConfirmResetPasswordLoading(prevState.user, prevState.appConfig));
    try {
      await _userService.confirmResetPassword(
        resetCode: event.resetCode,
        resetData: event.resetData,
        newPassword: event.newPassword,
        userKey: event.userKey,
        userSalt: event.userSalt,
        backupKey: event.backupKey,
        backupSalt: event.backupSalt,
      );
      emit(ConfirmResetPasswordSuccess(prevState.user, prevState.appConfig));
    } on Exception catch (e) {
      emit(
        StartResetPasswordError(
          e.toString(),
          prevState.user,
          prevState.appConfig,
        ),
      );
    }
  }

  FutureOr<void> _onGetBackupKeyForPasswordReset(
    GetBackupKeyForResetPassword event,
    Emitter<AuthState> emit,
  ) async {
    final prevState = state;
    emit(
      GetBackupKeyForResetPasswordLoading(prevState.user, prevState.appConfig),
    );
    try {
      final result = await _userService.getBackupKeyForPasswordReset(
        event.resetCode,
      );
      emit(
        GetBackupKeyForResetPasswordSuccess(
          result['backup_key'],
          result['backup_salt'],
        ),
      );
    } on Exception catch (e) {
      emit(
        GetBackupKeyForResetPasswordError(
          e.toString(),
          prevState.user,
          prevState.appConfig,
        ),
      );
    }
  }
}
