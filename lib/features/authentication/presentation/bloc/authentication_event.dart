part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  final String? username;

  const AuthenticationEvent({this.username});

  @override
  List<Object?> get props => [username];
}

final class AuthenticateUser extends AuthenticationEvent {
  const AuthenticateUser({super.username});
}

final class GetUser extends AuthenticationEvent {}
