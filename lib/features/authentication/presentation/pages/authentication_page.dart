import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medhub/core/common/widgets/auth_text_field.dart';
import 'package:medhub/core/common/widgets/large_button.dart';
import 'package:medhub/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:medhub/features/authentication/presentation/pages/otp_page.dart';

class AuthenticationPageExtra {
  final bool isLogin;

  const AuthenticationPageExtra({required this.isLogin});
}

class AuthenticationPage extends StatefulWidget {
  final AuthenticationPageExtra? authenticationPageExtra;

  const AuthenticationPage({
    super.key,
    this.authenticationPageExtra,
  });

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  late bool _isLogin;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.authenticationPageExtra != null) {
      _isLogin = widget.authenticationPageExtra!.isLogin;
    } else {
      _isLogin = false;
    }
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Color(0xff090F47),
            ),
          ),
        ),
      ),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationBlocSuccess) {
            _isLogin
                ? context.goNamed('home')
                : context.goNamed(
                    'otp',
                    extra: OtpPageExtra(
                      mobileNumber: _phoneController.text.trim(),
                    ),
                  );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _isLogin ? 'Welcome Back!' : 'Create your account',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
                AuthTextField(
                  controller: _usernameController,
                  isObscure: false,
                  isPassword: false,
                  isLogin: _isLogin ? true : false,
                  prefixIcon: _isLogin
                      ? Image.asset('assets/images/username.png')
                      : null,
                  label: _isLogin ? 'Username' : 'Your Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                if (_isLogin)
                  AuthTextField(
                    controller: _passwordController,
                    isObscure: true,
                    isPassword: false,
                    isLogin: true,
                    prefixIcon: Image.asset('assets/images/password.png'),
                    label: 'Password',
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Forgot?',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff090F47).withOpacity(0.45),
                          ),
                        ),
                      ],
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      return null;
                    },
                  )
                else
                  AuthTextField(
                    controller: _phoneController,
                    isObscure: false,
                    isPassword: false,
                    isLogin: false,
                    label: 'Mobile Number',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mobile Number cannot be empty';
                      }
                      return null;
                    },
                  ),
                if (!_isLogin) const SizedBox(height: 16),
                if (_isLogin)
                  const SizedBox()
                else
                  AuthTextField(
                    controller: _emailController,
                    isObscure: false,
                    isLogin: false,
                    isPassword: false,
                    label: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty';
                      } else if (!value.contains('@')) {
                        return 'Please provide a valid email address';
                      }
                      return null;
                    },
                  ),
                if (!_isLogin) const SizedBox(height: 16),
                if (_isLogin)
                  const SizedBox()
                else
                  AuthTextField(
                    controller: _passwordController,
                    isObscure: true,
                    isLogin: false,
                    isPassword: true,
                    label: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty';
                      } else if (value.length <= 8) {
                        return 'Password minimal contains 8 characters';
                      }
                      return null;
                    },
                  ),
                SizedBox(
                  height: _isLogin ? 56 : 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: LargeButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthenticationBloc>().add(
                              AuthenticateUser(
                                username: _usernameController.text.trim(),
                              ),
                            );
                      }
                    },
                    label: Text(
                      _isLogin ? 'SIGN IN' : 'CREATE ACCOUNT',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    isPrimary: true,
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () => setState(() {
                    _isLogin = !_isLogin;
                  }),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/chevron.svg'),
                      const SizedBox(width: 12),
                      Text(
                        _isLogin
                            ? 'Don’t have an account? Sign Up'
                            : 'Already have account? Login',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff090F47).withOpacity(0.45),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
