import 'package:flutter/cupertino.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:medhub/features/cart/presentation/widgets/address_item.dart';

List<Address> addressItems = [
  Address(
    address: 'Jl. Rajawali No. 02, Surabaya',
    phone: '(031) 555-024',
    title: 'Home',
  ),
  Address(
    address: 'Jl. Gajah Mada No. 05, Sidoarjo',
    phone: '(031) 555-024',
    title: 'Office',
  ),
];

class AddressListview extends StatefulWidget {
  const AddressListview({super.key});

  @override
  State<AddressListview> createState() => _AddressListviewState();
}

class _AddressListviewState extends State<AddressListview> {
  String? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Delivery Address',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: addressItems.length,
            itemBuilder: (context, index) => AddressItem(
              address: addressItems[index],
              selectedAddress: selectedAddress ?? addressItems[0].id,
              onAddressChecked: (value) => setState(
                () {
                  selectedAddress = value;
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 11),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              FeatherIcons.plus,
              color: Color(0xff00A59B),
            ),
            SizedBox(width: 8),
            SizedBox(
              height: 16,
              child: Text(
                'Add Address',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff00A59B),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
