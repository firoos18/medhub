import 'package:flutter/material.dart';

class BottomNavbarEntity {
  final Widget activeIcon;
  final Widget icon;

  const BottomNavbarEntity({
    required this.activeIcon,
    required this.icon,
  });
}

class CustomNavbar extends StatefulWidget {
  final List<BottomNavbarEntity> items;
  final void Function(int) onTap;
  final int currentIndex;

  const CustomNavbar({
    super.key,
    required this.items,
    required this.onTap,
    this.currentIndex = 0,
  });

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff090F47).withOpacity(0.04),
            offset: const Offset(0, -7),
            blurRadius: 14,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.items
            .map(
              (item) => GestureDetector(
                onTap: () => widget.onTap(widget.items.indexOf(item)),
                child: widget.items.indexOf(item) == 2
                    ? Container(
                        padding: const EdgeInsets.all(11),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xff0F3759),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: widget.items.indexOf(item) == widget.currentIndex
                            ? item.activeIcon
                            : item.icon,
                      )
                    : widget.items.indexOf(item) == widget.currentIndex
                        ? item.activeIcon
                        : item.icon,
              ),
            )
            .toList(),
      ),
    );
  }
}
