import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCarouselImage extends StatefulWidget {
  final String imagePath;

  const ProductCarouselImage({
    super.key,
    required this.imagePath,
  });

  @override
  State<ProductCarouselImage> createState() => _ProductCarouselImageState();
}

class _ProductCarouselImageState extends State<ProductCarouselImage> {
  int imagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.loose,
            flex: 4,
            child: PageView.builder(
              onPageChanged: (value) => setState(() {
                imagePosition = value;
              }),
              itemCount: 3,
              pageSnapping: true,
              itemBuilder: (context, index) => List.generate(
                3,
                (index) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF8F8F8),
                  ),
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              )[index],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
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
      ),
    );
  }
}
