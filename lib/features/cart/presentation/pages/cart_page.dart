import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhub/core/common/widgets/large_button.dart';
import 'package:medhub/core/helpers/currency_format.dart';
import 'package:medhub/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:medhub/features/cart/presentation/pages/checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    context.read<CartBloc>().add(GetCartItems());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Your Cart',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          int totalPrice = 0;

          if (state is CartLoaded) {
            if (state.products != null) {
              for (var i = 0; i < state.products!.length; i++) {
                totalPrice += (state.products![i].quantity *
                    state.products![i].products.price);
              }
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${state.products!.length} items in your cart',
                            style: GoogleFonts.sofiaSans(
                              fontSize: 14,
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                color:
                                    const Color(0xff090F47).withOpacity(0.45),
                              ),
                            ),
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                FeatherIcons.plus,
                                color: Color(0xff00A59B),
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              SizedBox(
                                height: 16,
                                child: Text(
                                  'Add more',
                                  style: TextStyle(
                                    color: Color(0xff00A59B),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      Flexible(
                        fit: FlexFit.loose,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.products!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100,
                              width: double.infinity,
                              padding: const EdgeInsets.only(bottom: 16),
                              margin: const EdgeInsets.only(top: 16),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black.withOpacity(0.05),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Image.asset(
                                      state.products![index].products.imagePath,
                                      fit: BoxFit.cover,
                                      scale: 1,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state.products![index]
                                                      .products.title,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  'bottle of ${state.products![index].packageSize} pellets',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xff090F47)
                                                            .withOpacity(0.45),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () => context
                                                  .read<CartBloc>()
                                                  .add(
                                                    RemoveCartItem(
                                                        products: state
                                                            .products![index]),
                                                  ),
                                              child: SvgPicture.asset(
                                                  'assets/images/x.svg'),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              localedPrice.format(state
                                                  .products![index]
                                                  .products
                                                  .price),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Container(
                                              width: 95,
                                              height: 32,
                                              color: const Color(0xffF1FFEA),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () => context
                                                        .read<CartBloc>()
                                                        .add(
                                                          QuantityDecrement(
                                                              products: state
                                                                      .products![
                                                                  index]),
                                                        ),
                                                    child: Container(
                                                      width: 32,
                                                      height: 32,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            Color(0xff00A59B),
                                                      ),
                                                      child: const Icon(
                                                        FeatherIcons.minus,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(state
                                                      .products![index].quantity
                                                      .toString()),
                                                  GestureDetector(
                                                    onTap: () => context
                                                        .read<CartBloc>()
                                                        .add(
                                                          QuantityIncrement(
                                                              products: state
                                                                      .products![
                                                                  index]),
                                                        ),
                                                    child: Container(
                                                      width: 32,
                                                      height: 32,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            Color(0xff0F3759),
                                                      ),
                                                      child: const Icon(
                                                        FeatherIcons.plus,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 18),
                      Container(
                        width: double.infinity,
                        height: 48,
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: const Color(0xffE0E0E0),
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  FeatherIcons.tag,
                                  size: 20,
                                ),
                                SizedBox(width: 16),
                                Text(
                                  '1 Coupon applied',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff00A59B),
                                  ),
                                ),
                              ],
                            ),
                            SvgPicture.asset('assets/images/x.svg'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payment Summary',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Order Total',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color(0xff090F47).withOpacity(0.45),
                                ),
                              ),
                              Text(
                                localedPrice.format(totalPrice),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff090F47),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Items Discount',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color(0xff090F47).withOpacity(0.45),
                                ),
                              ),
                              Text(
                                state.products!.isNotEmpty
                                    ? '- ${localedPrice.format(totalPrice * 10 / 100)}'
                                    : localedPrice.format(0),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff090F47),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Coupon Discount',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color(0xff090F47).withOpacity(0.45),
                                ),
                              ),
                              Text(
                                state.products!.isNotEmpty
                                    ? '- ${localedPrice.format(15800)}'
                                    : localedPrice.format(0),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff090F47),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shipping',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color(0xff090F47).withOpacity(0.45),
                                ),
                              ),
                              const Text(
                                'Free',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff090F47),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Divider(
                            color: Colors.black.withOpacity(0.05),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                state.products!.isNotEmpty
                                    ? localedPrice.format(
                                        totalPrice -
                                            (totalPrice * 10 / 100) -
                                            15800,
                                      )
                                    : localedPrice.format(0),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  LargeButton(
                    onPressed: () => state.products!.isNotEmpty
                        ? context.pushNamed(
                            'checkout',
                            extra: CheckoutPageExtra(
                              total:
                                  (totalPrice - (totalPrice * 10 / 100) - 15800)
                                      .toInt(),
                            ),
                          )
                        : null,
                    label: Text(
                      state.products!.isNotEmpty
                          ? 'Place Order @ ${localedPrice.format(
                              totalPrice - (totalPrice * 10 / 100) - 15800,
                            )}'
                          : "Place Order @ ${localedPrice.format(0)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    isPrimary: true,
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }
}
