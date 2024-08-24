import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:medhub/core/common/widgets/custom_navbar.dart';

class ScaffoldPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldPage({
    super.key,
    required this.navigationShell,
  });

  @override
  State<ScaffoldPage> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  int currentIndex = 0;

  List<BottomNavbarEntity> items = [
    const BottomNavbarEntity(
      activeIcon: Icon(
        FeatherIcons.home,
        color: Color(0xff00A59B),
      ),
      icon: Icon(
        FeatherIcons.home,
      ),
    ),
    const BottomNavbarEntity(
      activeIcon: Icon(
        FeatherIcons.bell,
        color: Color(0xff00A59B),
      ),
      icon: Icon(
        FeatherIcons.bell,
      ),
    ),
    const BottomNavbarEntity(
      activeIcon: Icon(
        FeatherIcons.plusSquare,
        color: Color(0xff00A59B),
      ),
      icon: Icon(
        FeatherIcons.plusSquare,
        color: Colors.white,
      ),
    ),
    const BottomNavbarEntity(
      activeIcon: Icon(
        FeatherIcons.shoppingBag,
        color: Color(0xff00A59B),
      ),
      icon: Icon(
        FeatherIcons.shoppingBag,
      ),
    ),
    const BottomNavbarEntity(
      activeIcon: Icon(
        FeatherIcons.user,
        color: Color(0xff00A59B),
      ),
      icon: Icon(
        FeatherIcons.user,
      ),
    ),
  ];

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.navigationShell),
      bottomNavigationBar: CustomNavbar(
        items: items,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          _goBranch(index);
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
