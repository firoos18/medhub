import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isLogin;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final bool isObscure;
  final bool isPassword;
  final String? Function(String?) validator;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.isLogin,
    required this.label,
    required this.isObscure,
    required this.isPassword,
    required this.validator,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool _isObscure;

  @override
  void initState() {
    _isObscure = widget.isObscure;

    super.initState();
  }

  void _toggleObscureText() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscure,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon != null
            ? widget.suffixIcon!
            : widget.isPassword
                ? GestureDetector(
                    onTap: _toggleObscureText,
                    child: widget.suffixIcon ??
                        Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                  )
                : const SizedBox(),
        label: Text(
          widget.label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: const Color(0xff090F47).withOpacity(0.45),
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: const Color(0xff090F47).withOpacity(0.1),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: const Color(0xff090F47).withOpacity(0.1),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color(0xff00A59B),
          ),
        ),
      ),
    );
  }
}
