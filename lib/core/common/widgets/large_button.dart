import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget label;
  final bool isPrimary;

  const LargeButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
        backgroundColor: isPrimary ? const Color(0xff0F3759) : Colors.white,
        foregroundColor: isPrimary
            ? Colors.white
            : const Color(0xff0F3759).withOpacity(0.75),
        side: isPrimary
            ? null
            : BorderSide(
                width: 1,
                color: const Color(0xff0F3759).withOpacity(0.1),
              ),
        elevation: isPrimary ? 7 : 0,
        shadowColor: const Color(0xff4157FF).withOpacity(0.1),
        disabledBackgroundColor: const Color(0xffF5F5F5),
        disabledForegroundColor: Colors.white60,
      ),
      onPressed: onPressed,
      child: label,
    );
  }
}
