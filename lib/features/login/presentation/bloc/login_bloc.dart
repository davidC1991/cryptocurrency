import 'package:bloc/bloc.dart';
import 'package:crypto/core/enums/enums_state.dart';
import 'package:crypto/features/login/domain/usecases/auth.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(Auth auth)
      : _auth = auth,
        super(const LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is ResetLogin) {
        emit(const LoginInitial());
      }

      if (event is OnLogin) {
        emit(state.copyWith(blocStatus: BlocStatus.submissionInProgress));
        final result = await _auth(
          email: event.email,
          password: event.password,
        );
        result.fold(
            (error) => emit(_error(error)),
            (user) => emit(state.copyWith(
                  blocStatus: BlocStatus.submissionSuccess,
                  userId: user.userId,
                  email: user.email,
                )));
      }
    });
  }
  final Auth _auth;

  LoginState _error(String error) =>
      state.copyWith(error: error, blocStatus: BlocStatus.submissionFailure);
}
