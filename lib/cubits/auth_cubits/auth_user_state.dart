abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccessfulLogin extends AuthState {}

class AuthFailedLogin extends AuthState {}

class AuthSuccessfulRegistration extends AuthState {}

class AuthFailedRegistration extends AuthState {}
