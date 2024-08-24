import 'package:flutter/cupertino.dart';
import 'package:medhub/features/cart/presentation/widgets/payment_item.dart';

List<PaymentMethod> paymentItems = [
  PaymentMethod(
    imagePath: 'assets/images/ovo.png',
    title: 'OVO',
  ),
  PaymentMethod(
    imagePath: 'assets/images/dana.png',
    title: 'Dana',
  ),
  PaymentMethod(
    imagePath: 'assets/images/spay.png',
    title: 'ShopeePay',
  ),
  PaymentMethod(
    imagePath: 'assets/images/gopay.png',
    title: 'GoPay',
  ),
];

class PaymentListview extends StatefulWidget {
  const PaymentListview({super.key});

  @override
  State<PaymentListview> createState() => _PaymentListviewState();
}

class _PaymentListviewState extends State<PaymentListview> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Payment Method',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff090F47).withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: paymentItems.length,
            itemBuilder: (context, index) => PaymentItem(
              paymentMethod: paymentItems[index],
              selectedPaymentMethod:
                  selectedPaymentMethod ?? paymentItems[0].id,
              onChanged: (value) => setState(() {
                selectedPaymentMethod = value;
              }),
            ),
          ),
        )
      ],
    );
  }
}
