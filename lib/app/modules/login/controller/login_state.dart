part of 'login_controller.dart';

enum LoginStatus { initial, loading, failure }

class LoginState extends Equatable {

  const LoginState.initial() : this._(status: LoginStatus.initial);

  const LoginState._({
    required this.status,
    this.errorMessage,
  });
  @override
  List<Object?> get props => [status, errorMessage];

  final LoginStatus status;
  final String? errorMessage;

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
  }) {
    return LoginState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
