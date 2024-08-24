import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medhub/features/categories/presentation/widgets/package_item.dart';

class PackageListview extends StatefulWidget {
  final int price;
  final List<int> packageSize;
  final ValueChanged<int> onSelectedPackageSize;

  const PackageListview({
    super.key,
    required this.price,
    required this.packageSize,
    required this.onSelectedPackageSize,
  });

  @override
  State<PackageListview> createState() => _PackageListviewState();
}

class _PackageListviewState extends State<PackageListview> {
  int? selectedPackage;

  @override
  void initState() {
    selectedPackage = widget.packageSize[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Package size',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemExtent: 120,
            itemCount: widget.packageSize.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedPackage = widget.packageSize[index];
                });
                widget.onSelectedPackageSize(selectedPackage!);
              },
              child: PackageItem(
                price: widget.price,
                packageSize: widget.packageSize[index],
                selectedPackage: selectedPackage,
              ),
            ),
          ),
        )
      ],
    );
  }
}
