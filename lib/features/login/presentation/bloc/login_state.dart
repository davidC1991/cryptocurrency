part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email,
    this.password,
    this.userId,
    this.blocStatus = BlocStatus.noSubmitted,
    this.error,
  });
  final String? email;
  final String? password;
  final String? userId;
  final String? error;
  final BlocStatus blocStatus;

  LoginState copyWith({
    String? email,
    String? password,
    String? userId,
    String? error,
    BlocStatus? blocStatus,
  }) =>
      LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        userId: userId ?? this.userId,
        error: error ?? this.error,
        blocStatus: blocStatus ?? this.blocStatus,
      );
  @override
  List<Object?> get props => [
        email,
        password,
        userId,
        blocStatus,
        error,
      ];
}

final class LoginInitial extends LoginState {
  const LoginInitial()
      : super(
          email: null,
          password: null,
          userId: null,
          error: null,
          blocStatus: BlocStatus.noSubmitted,
        );
}
