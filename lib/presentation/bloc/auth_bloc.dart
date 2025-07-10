import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/login_user.dart';
import '../../../domain/usecases/signup_user.dart';
import '../../domain/entities/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final SignupUser signupUser;

  AuthBloc({required this.loginUser, required this.signupUser}) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await loginUser(event.username, event.password);
        emit(AuthSuccess(user));
      } catch (_) {
        emit(AuthFailure('Login failed'));
      }
    });

    on<SignupRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signupUser(event.username, event.password);
        emit(AuthSuccess(user));
      } catch (_) {
        emit(AuthFailure('Signup failed'));
      }
    });
  }
}


// class SignupRequested extends AuthEvent {
//   final String email;
//   final String password;
//
//   SignupRequested(this.email, this.password);
// }
// if (event is SignupRequested) {
// emit(AuthLoading());
// final result = await signupUser(SignupParams(event.email, event.password));
// result.fold(
// (failure) => emit(AuthFailure(failure.message)),
// (user) => emit(AuthSuccess(user)),
// );
// }
