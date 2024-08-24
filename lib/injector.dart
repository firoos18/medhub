import 'package:get_it/get_it.dart';
import 'package:medhub/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:medhub/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:medhub/features/authentication/domain/repository/authentication_repository.dart';
import 'package:medhub/features/authentication/domain/usecases/authenticate_user_usecase.dart';
import 'package:medhub/features/authentication/domain/usecases/get_user_usecase.dart';
import 'package:medhub/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  injector.registerSingleton<AuthenticationDataSource>(
      AuthenticationDataSource(injector()));

  injector.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(injector()));

  injector.registerSingleton<AuthenticateUserUseCase>(
      AuthenticateUserUseCase(injector()));
  injector.registerSingleton<GetUserUseCase>(GetUserUseCase(injector()));

  injector.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(injector(), injector()));
}
