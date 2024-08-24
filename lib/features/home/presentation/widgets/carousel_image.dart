import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int imagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          onPageChanged: (value) => setState(() {
            imagePosition = value;
          }),
          itemCount: 3,
          itemBuilder: (context, index) => List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Stack(
                alignment: Alignment.bottomCenter,
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/carousel_image.png',
                  ),
                  Positioned.fill(
                    top: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        top: 50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 132,
                            child: Text(
                              'Save extra on every order',
                              style: TextStyle(
                                color: Color(0xff00A59B),
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 118,
                            child: Text(
                              'Etiam mollis metus non faucibus.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color:
                                    const Color(0xff090F47).withOpacity(0.65),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )[index],
        ),
        Positioned.fill(
          top: 130,
          left: 200,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => List.generate(
              3,
              (index) => Container(
                width: 4,
                height: 4,
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == imagePosition
                      ? const Color(0xff00A59B)
                      : const Color(0xff090F47).withOpacity(0.15),
                ),
              ),
            )[index],
          ),
        )
      ],
    );
  }
}
