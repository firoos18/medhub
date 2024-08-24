import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhub/core/common/widgets/large_button.dart';
import 'package:medhub/core/helpers/currency_format.dart';
import 'package:medhub/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:medhub/features/cart/presentation/widgets/address_listview.dart';
import 'package:medhub/features/cart/presentation/widgets/payment_listview.dart';

class CheckoutPageExtra {
  final int total;

  const CheckoutPageExtra({required this.total});
}

class CheckoutPage extends StatefulWidget {
  final CheckoutPageExtra checkoutPageExtra;

  const CheckoutPage({
    super.key,
    required this.checkoutPageExtra,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
          'Checkout',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        forceMaterialTransparency: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) => state is CartLoaded
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${state.products!.length} items in your cart',
                          style: GoogleFonts.sofiaSans(
                            fontSize: 14,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff090F47).withOpacity(0.45),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'TOTAL',
                              style: GoogleFonts.sofiaSans(
                                fontSize: 13,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color:
                                      const Color(0xff090F47).withOpacity(0.45),
                                ),
                              ),
                            ),
                            Text(
                              localedPrice
                                  .format(widget.checkoutPageExtra.total),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 11),
                    const AddressListview(),
                    const PaymentListview(),
                    const SizedBox(height: 21),
                    LargeButton(
                      onPressed: () {
                        context.read<CartBloc>().add(Checkout());
                        context.goNamed('payment-success');
                      },
                      label: Text(
                        'Pay Now ${localedPrice.format(widget.checkoutPageExtra.total)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      isPrimary: true,
                    )
                  ],
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
