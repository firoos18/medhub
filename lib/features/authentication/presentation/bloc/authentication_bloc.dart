import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medhub/features/authentication/domain/usecases/authenticate_user_usecase.dart';
import 'package:medhub/features/authentication/domain/usecases/get_user_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticateUserUseCase _authenticateUserUseCase;
  final GetUserUseCase _getUserUseCase;

  AuthenticationBloc(
    this._authenticateUserUseCase,
    this._getUserUseCase,
  ) : super(AuthenticationBlocInitial()) {
    on<AuthenticateUser>(onAuthenticateUser);
    on<GetUser>(onGetUser);
  }

  void onAuthenticateUser(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationBlocLoading());

    await _authenticateUserUseCase.authenticationRepository
        .authenticateUser(username: event.username);
    emit(AuthenticationBlocSuccess(username: event.username));
  }

  void onGetUser(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationBlocLoading());

    final data = _getUserUseCase.authenticationRepository.getUser();
    if (data != null) {
      emit(AuthenticationBlocSuccess(username: data));
    }
  }
}
