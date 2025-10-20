part of 'auth.bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState(this.user, this.appConfig );
  final UserEntity? user;
  final ABConfig? appConfig;

  @override
  List<Object?> get props => [user, appConfig];
}

class LoggedOut extends AuthState {
  const LoggedOut(super.user, super.appConfig);

  @override
  String toString() => 'LoggedOut { }';
}

class Loading extends AuthState {
  const Loading(super.user, super.appConfig);

  @override
  String toString() => 'Loading { }';
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message, super.user, super.appConfig);

  @override
  String toString() => 'Error { $message }';
}

class LoggedIn extends AuthState {
  final bool? isRegistration;
  const LoggedIn(UserEntity super.user, this.isRegistration, super.appConfig);

  @override
  List<Object?> get props => [user];

  @override
  String toString() => 'LoggedIn { user: $user }';
}

class UserDeleting extends AuthState {
  const UserDeleting(super.user, super.appConfig);

  @override
  String toString() => 'UserDeleting { }';
}

class UserDeleted extends AuthState {
  const UserDeleted(super.user, super.appConfig);

  @override
  String toString() => 'UserDeleted { }';
}

class UserUpdateProfileLoading extends AuthState {
  const UserUpdateProfileLoading(super.user, super.appConfig);

  @override
  String toString() => 'UserUpdateProfileLoading { }';
}

class UserUpdateProfileSuccess extends AuthState {
  const UserUpdateProfileSuccess(UserEntity super.user, super.appConfig);

  @override
  String toString() => 'UserUpdateProfileSuccess { user: $user }';
}

class UserChangePasswordLoading extends AuthState {
  const UserChangePasswordLoading(super.user, super.appConfig);

  @override
  String toString() => 'UserChangePasswordLoading { }';
}

class UserChangePasswordSuccess extends AuthState {
  const UserChangePasswordSuccess(UserEntity super.user, super.appConfig);

  @override
  String toString() => 'UserChangePasswordSuccess { user: $user }';
}

class StartResetPasswordLoading extends AuthState {
  const StartResetPasswordLoading(super.user, super.appConfig);

  @override
  String toString() => 'UserStartResetPasswordLoading { }';
}

class StartResetPasswordSuccess extends AuthState {
  const StartResetPasswordSuccess(super.user, super.appConfig);

  @override
  String toString() => 'UserStartResetPasswordSuccess { }';
}

class StartResetPasswordError extends AuthState {
  final String message;
  const StartResetPasswordError(this.message, super.user, super.appConfig);

  @override
  String toString() => 'UserStartResetPasswordError { $message }';
}

class ConfirmResetPasswordLoading extends AuthState {
  const ConfirmResetPasswordLoading(super.user, super.appConfig);

  @override
  String toString() => 'UserConfirmResetPasswordLoading { }';
}

class ConfirmResetPasswordSuccess extends AuthState {
  const ConfirmResetPasswordSuccess(super.user, super.appConfig);

  @override
  String toString() => 'UserConfirmResetPasswordSuccess { }';
}

class ConfirmResetPasswordError extends AuthState {
  final String message;
  const ConfirmResetPasswordError(this.message, super.user, super.appConfig);

  @override
  String toString() => 'UserConfirmResetPasswordError { $message }';
}

class GetBackupKeyForResetPasswordLoading extends AuthState {
  const GetBackupKeyForResetPasswordLoading(super.user, super.appConfig);

  @override
  String toString() => 'GetBackupKeyForResetPasswordLoading { }';
}

class GetBackupKeyForResetPasswordSuccess extends AuthState {
  final String? backupKey;
  final String? backupSalt;

  const GetBackupKeyForResetPasswordSuccess(
    this.backupKey,
    this.backupSalt,
  ) : super(null, null);

  @override
  String toString() => 'GetBackupKeyForResetPasswordSuccess { $backupKey, $backupSalt }';
}

final class GetBackupKeyForResetPasswordError extends AuthState {
  final String message;
    const GetBackupKeyForResetPasswordError(this.message, super.user, super.appConfig);

  @override
  String toString() => 'GetBackupKeyForResetPasswordError { $message }';
}

final class JoinWaitingListLoading extends AuthState {
  const JoinWaitingListLoading(super.user, super.appConfig);

  @override
  String toString() => 'JoinWaitingListLoading { }';
}

final class JoinWaitingListSuccess extends AuthState {
  final int? beforeCount;
  const JoinWaitingListSuccess(this.beforeCount, super.user, super.appConfig);

  @override
  String toString() => 'JoinWaitingListSuccess { $beforeCount }';
}

final class JoinWaitingListError extends AuthState {
  final String message;
  const JoinWaitingListError(this.message, super.user, super.appConfig);

  @override
  String toString() => 'JoinWaitingListError { $message }';
}