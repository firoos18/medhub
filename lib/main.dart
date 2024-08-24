import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhub/core/router/router.dart';
import 'package:medhub/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:medhub/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:medhub/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc(injector(), injector()),
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          textTheme: GoogleFonts.overpassTextTheme().apply(
            bodyColor: const Color(0xff090F47),
            displayColor: const Color(0xff090F47),
          ),
          scaffoldBackgroundColor: const Color(0xffF7FBFF),
        ),
      ),
    );
  }
}
