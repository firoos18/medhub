import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medhub/core/common/widgets/large_button.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 144,
          bottom: 24,
          right: 24,
          left: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/images/success.svg',
                ),
                const SizedBox(height: 61),
                const Text(
                  'Thank you',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Your Order will be delivered with invoice ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff090F47).withOpacity(0.45),
                        ),
                      ),
                      const TextSpan(
                        text: '#INV20240817',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff090F47).withOpacity(0.45),
                        ),
                      ),
                      TextSpan(
                        text:
                            'You can track the delivery in the order section.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff090F47).withOpacity(0.45),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            LargeButton(
              onPressed: () => context.goNamed('home'),
              label: const Text(
                'Continue Order',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
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
