import 'package:flutter/cupertino.dart';
import 'package:medhub/core/helpers/currency_format.dart';

class PackageItem extends StatelessWidget {
  final int price;
  final int packageSize;
  final int? selectedPackage;

  const PackageItem({
    super.key,
    required this.price,
    required this.packageSize,
    required this.selectedPackage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: selectedPackage != null && selectedPackage == packageSize
            ? const Color(0xff00A59B).withOpacity(0.05)
            : const Color(0xffF5F5F5),
        border: selectedPackage != null && selectedPackage == packageSize
            ? Border.all(color: const Color(0xff00A59B))
            : null,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            localedPrice.format(price * packageSize / 100),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '$packageSize Pellets',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
