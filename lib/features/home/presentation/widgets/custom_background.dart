import 'package:flutter/material.dart';
import 'package:medhub/features/home/presentation/widgets/custom_quarter_circle.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 232,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff1B75BC),
                Color(0xff00AAF5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: 170,
            height: 170,
            child: QuarterCircle(
              circleAlignment: CircleAlignment.bottomLeft,
              color: Colors.white.withOpacity(0.07),
            ),
          ),
        )
      ],
    );
  }
}
