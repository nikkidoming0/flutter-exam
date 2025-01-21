part of 'global_bloc.dart';

sealed class GlobalEvent extends Equatable {
  const GlobalEvent();
}

class LoginPressBtnEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}

class LoginUsernameTxtEvent extends GlobalEvent {

  final String userName;

  const LoginUsernameTxtEvent({required this.userName});

  @override
  List<Object?> get props => [
    userName
  ];
}

class LoginVerifyEvent extends GlobalEvent {
  final String otp;

  const LoginVerifyEvent({required this.otp});

  @override
  List<Object?> get props => [
    otp
  ];
}

class LoginHideDialogEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}

class LoginResetEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}

class GetSocialDataEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}