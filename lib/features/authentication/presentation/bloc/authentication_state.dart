part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  final String? username;

  const AuthenticationState({this.username});

  @override
  List<Object?> get props => [username];
}

final class AuthenticationBlocInitial extends AuthenticationState {}

final class AuthenticationBlocLoading extends AuthenticationState {}

final class AuthenticationBlocSuccess extends AuthenticationState {
  const AuthenticationBlocSuccess({super.username});
}
