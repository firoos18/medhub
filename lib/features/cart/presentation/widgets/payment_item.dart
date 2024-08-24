import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PaymentMethod {
  final String id;
  final String title;
  final String imagePath;

  PaymentMethod({
    required this.imagePath,
    required this.title,
  }) : id = uuid.v4();
}

class PaymentItem extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final String selectedPaymentMethod;
  final ValueChanged<String?> onChanged;

  const PaymentItem({
    super.key,
    required this.paymentMethod,
    required this.selectedPaymentMethod,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff090F47).withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Image.asset(paymentMethod.imagePath),
              ),
              const SizedBox(width: 16),
              Text(
                paymentMethod.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Radio(
            value: paymentMethod.id,
            groupValue: selectedPaymentMethod,
            onChanged: (value) => onChanged(value),
            activeColor: const Color(0xff00A59B),
            visualDensity: VisualDensity.comfortable,
          ),
        ],
      ),
    );
  }
}
