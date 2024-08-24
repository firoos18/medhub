import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medhub/core/common/widgets/large_button.dart';
import 'package:medhub/features/authentication/presentation/pages/authentication_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 114),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/welcome.svg',
              ),
              const SizedBox(height: 34),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffFFA629),
                    ),
                    child: const Text(
                      'MedHub',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 257,
                height: 48,
                child: Text(
                  'Do you want some help with your health to get better life?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff090F47).withOpacity(0.45),
                  ),
                ),
              ),
              const SizedBox(height: 34),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    LargeButton(
                      isPrimary: true,
                      onPressed: () => context.pushNamed(
                        'authentication',
                        extra: const AuthenticationPageExtra(isLogin: false),
                      ),
                      label: const Text(
                        'SIGN UP WITH EMAIL',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    LargeButton(
                      isPrimary: false,
                      onPressed: () {},
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/facebook.svg'),
                          const SizedBox(width: 21),
                          const Text(
                            'SIGN UP WITH EMAIL',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    LargeButton(
                      isPrimary: false,
                      onPressed: () {},
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/google.svg'),
                          const SizedBox(width: 21),
                          const Text(
                            'SIGN UP WITH EMAIL',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => context.pushNamed(
                  'authentication',
                  extra: const AuthenticationPageExtra(isLogin: true),
                ),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff090F47).withOpacity(0.45),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
