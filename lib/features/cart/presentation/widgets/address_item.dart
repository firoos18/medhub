import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Address {
  final String id;
  final String title;
  final String address;
  final String phone;

  Address({
    required this.address,
    required this.phone,
    required this.title,
  }) : id = uuid.v4();
}

class AddressItem extends StatelessWidget {
  final Address address;
  final String selectedAddress;
  final ValueChanged<String?> onAddressChecked;

  const AddressItem({
    super.key,
    required this.address,
    required this.selectedAddress,
    required this.onAddressChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff090F47).withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Radio(
                value: address.id,
                groupValue: selectedAddress,
                onChanged: (value) => onAddressChecked(value),
                activeColor: const Color(0xff00A59B),
                visualDensity: VisualDensity.comfortable,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    address.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    address.phone,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff090F47).withOpacity(0.45),
                    ),
                  ),
                  Text(
                    address.address,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff090F47).withOpacity(0.45),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset('assets/images/edit.svg'),
        ],
      ),
    );
  }
}
