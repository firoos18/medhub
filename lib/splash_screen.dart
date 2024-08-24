import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medhub/features/authentication/presentation/bloc/authentication_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<AuthenticationBloc>().add(GetUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationBlocSuccess) {
            Future.delayed(const Duration(seconds: 2))
                .then((value) => context.goNamed('home'));
          } else {
            Future.delayed(const Duration(seconds: 2)).then(
              (value) => context.goNamed(
                'onboarding',
              ),
            );
          }
        },
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SvgPicture.asset(
                  'assets/images/splash_background.svg',
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                ),
                Center(
                  child: SvgPicture.asset('assets/images/logo.svg'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
