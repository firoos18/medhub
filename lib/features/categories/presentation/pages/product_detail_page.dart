import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:medhub/core/common/widgets/large_button.dart';
import 'package:medhub/core/helpers/currency_format.dart';
import 'package:medhub/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:medhub/features/categories/presentation/widgets/package_listview.dart';
import 'package:medhub/features/categories/presentation/widgets/product_carousel_image.dart';
import 'package:medhub/features/categories/presentation/widgets/products_item.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:badges/badges.dart' as badges;

class RatingBar {
  final int rate;
  final double value;

  const RatingBar({
    required this.rate,
    required this.value,
  });
}

List<RatingBar> ratingList = [
  const RatingBar(rate: 5, value: 0.67),
  const RatingBar(rate: 4, value: 0.20),
  const RatingBar(rate: 3, value: 0.7),
  const RatingBar(rate: 2, value: 0),
  const RatingBar(rate: 1, value: 0.2),
];

class ProductDetailPageExtra {
  final Products products;

  const ProductDetailPageExtra({required this.products});
}

class ProductDetailPage extends StatefulWidget {
  final ProductDetailPageExtra productDetailPageExtra;

  const ProductDetailPage({
    super.key,
    required this.productDetailPageExtra,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int? selectedPackageSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          badges.Badge(
            badgeStyle: const badges.BadgeStyle(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            position: badges.BadgePosition.topEnd(
              top: 1,
              end: 2,
            ),
            child: const Icon(
              FeatherIcons.bell,
            ),
          ),
          const SizedBox(width: 16),
          const Icon(FeatherIcons.shoppingBag),
          const SizedBox(width: 24),
        ],
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
      ),
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartSuccess) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Product Added to the Cart!')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productDetailPageExtra.products.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Etiam mollis metus non purus',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff090F47).withOpacity(0.45),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ProductCarouselImage(
                      imagePath:
                          widget.productDetailPageExtra.products.imagePath,
                    ),
                    const SizedBox(height: 34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localedPrice.format(
                                  widget.productDetailPageExtra.products.price),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Etiam mollis',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color(0xff090F47).withOpacity(0.45),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            if (selectedPackageSize != null) {
                              context.read<CartBloc>().add(
                                    AddProductToCart(
                                      products: CartProductItem(
                                        packageSize: selectedPackageSize!,
                                        products: widget
                                            .productDetailPageExtra.products,
                                        quantity: 1,
                                      ),
                                    ),
                                  );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select package size!'),
                                ),
                              );
                            }
                          },
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                FeatherIcons.plusSquare,
                                color: Color(0xff00A59B),
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 16,
                                child: Text(
                                  'Add to cart',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff00A59B),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 18),
                    Divider(
                      color: Colors.black.withOpacity(0.1),
                    ),
                    const SizedBox(height: 9),
                    SizedBox(
                      height: 140,
                      child: PackageListview(
                          price: widget.productDetailPageExtra.products.price,
                          packageSize: widget
                              .productDetailPageExtra.products.packageSize,
                          onSelectedPackageSize: (value) {
                            setState(() {
                              selectedPackageSize = value;
                            });
                          }),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Product Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff090F47).withOpacity(0.45),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Rating and Reviews',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 36,
                                    child: Text(
                                      widget.productDetailPageExtra.products
                                          .rating
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Color(0xffFFC000),
                                    size: 32,
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: 110,
                                child: Text(
                                  '923 Ratings and 257 Reviews',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff090F47)
                                        .withOpacity(0.45),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 90,
                          child: VerticalDivider(
                            color: Colors.black.withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          fit: FlexFit.tight,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: ratingList.length,
                            itemBuilder: (context, index) => Row(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(ratingList[index].rate.toString()),
                                    const SizedBox(width: 2),
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xffFFC000),
                                      size: 16,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2.6,
                                  height: 3,
                                  child: LinearPercentIndicator(
                                    percent: ratingList[index].value,
                                    progressColor: const Color(0xff00A59B),
                                    backgroundColor:
                                        Colors.black.withOpacity(0.1),
                                  ),
                                ),
                                Text(
                                  '${(ratingList[index].value * 100).toInt()}%',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff090F47)
                                        .withOpacity(0.45),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 52),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Lorem Hoffman',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xffFFC000),
                                      size: 20,
                                    ),
                                    const SizedBox(width: 4),
                                    SizedBox(
                                      height: 16,
                                      child: Text(
                                        '4.2',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color: const Color(0xff090F47)
                                              .withOpacity(0.45),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Text(
                              '05 August 2024',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color:
                                    const Color(0xff090F47).withOpacity(0.45),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0xff090F47).withOpacity(0.45),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                LargeButton(
                  onPressed: () => context.pushNamed('cart'),
                  label: const Text(
                    'GO TO CART',
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
        ),
      ),
    );
  }
}
