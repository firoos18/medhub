import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medhub/core/helpers/currency_format.dart';

class Deals {
  final String title;
  final String imagePath;
  final int price;
  final double rating;

  const Deals({
    required this.imagePath,
    required this.price,
    required this.title,
    required this.rating,
  });
}

class DealsItem extends StatelessWidget {
  final Deals deals;

  const DealsItem({
    super.key,
    required this.deals,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 250,
      margin: const EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 154,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(10),
                topStart: Radius.circular(10),
              ),
              color: Color(0xffEEEEF0),
            ),
            child: Image.asset(
              deals.imagePath,
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deals.title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      localedPrice.format(deals.price),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      height: 24,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 4,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        color: Color(0xff00A59B),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/star.svg'),
                          const SizedBox(width: 4),
                          Text(
                            deals.rating.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
