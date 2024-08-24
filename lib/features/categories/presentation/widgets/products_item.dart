import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medhub/core/helpers/currency_format.dart';
import 'package:medhub/features/categories/presentation/pages/product_detail_page.dart';
import 'package:morphable_shape/morphable_shape.dart';
import 'package:uuid/uuid.dart';
import 'dart:math' as math;

const uuid = Uuid();

class Products {
  String id;
  final String title;
  final String imagePath;
  final int price;
  final double rating;
  final bool isSale;
  final int? discount;
  final List<int> packageSize;

  Products({
    required this.imagePath,
    required this.isSale,
    required this.price,
    required this.rating,
    required this.title,
    required this.packageSize,
    this.discount,
  }) : id = uuid.v4();
}

class ProductsItem extends StatelessWidget {
  final Products products;

  const ProductsItem({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        'product-details',
        pathParameters: {'id': products.id},
        extra: ProductDetailPageExtra(
          products: products,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          border: Border.all(
            width: 1,
            color: const Color(0xffEBEBEB),
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  height: 158,
                  decoration: const BoxDecoration(
                    color: Color(0xffF5F7FA),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(9),
                        topRight: Radius.circular(9)),
                  ),
                  child: Image.asset(
                    products.imagePath,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 16, left: 16),
                  child: Column(
                    children: [
                      Text(
                        products.title,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            localedPrice.format(
                              products.price,
                            ),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
                                  products.rating.toString(),
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
                      )
                    ],
                  ),
                )
              ],
            ),
            if (products.isSale)
              SizedBox(
                width: 70,
                height: 70,
                child: Material(
                  shape: RectangleShapeBorder(
                    cornerStyles: const RectangleCornerStyles.only(
                      topLeft: CornerStyle.rounded,
                      bottomRight: CornerStyle.straight,
                    ),
                    borderRadius: DynamicBorderRadius.only(
                      topLeft: DynamicRadius.circular(10.toPXLength),
                      bottomRight: DynamicRadius.circular(150.toPXLength),
                    ),
                  ),
                  color: products.isSale && products.discount != null
                      ? const Color(0xffFFC618)
                      : const Color(0xffFF5A5A),
                  child: Transform.rotate(
                    angle: -math.pi / 4,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 16,
                        left: products.isSale && products.discount != null
                            ? 10
                            : 20,
                      ),
                      child: Text(
                        products.isSale && products.discount != null
                            ? '${products.discount}% OFF'
                            : 'SALE',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
