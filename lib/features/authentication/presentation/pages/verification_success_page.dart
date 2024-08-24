import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medhub/core/common/widgets/large_button.dart';

class VerificationSuccessPage extends StatelessWidget {
  const VerificationSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 72),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Center(
                  child: SvgPicture.asset('assets/images/success.svg'),
                ),
                const SizedBox(height: 52),
                const Text(
                  'Phone Number Verified',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 251,
                  height: 72,
                  child: Text(
                    'Congradulations, your phone number has been verified. You can start using the app',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff090F47).withOpacity(0.45),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            LargeButton(
              onPressed: () => context.goNamed('home'),
              label: const Text(
                'CONTINUE',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              isPrimary: true,
            )
          ],
        ),
      ),
    );
  }
}
