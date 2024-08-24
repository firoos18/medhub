import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:medhub/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:medhub/features/home/presentation/widgets/brands_listview.dart';
import 'package:medhub/features/home/presentation/widgets/carousel_image.dart';
import 'package:medhub/features/home/presentation/widgets/category_listview.dart';
import 'package:medhub/features/home/presentation/widgets/custom_background.dart';
import 'package:medhub/features/home/presentation/widgets/deals_listview.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: SizedBox(
          height: 1100,
          width: MediaQuery.of(context).size.width,
          child: Material(
            color: const Color(0xffF7FBFF),
            child: Stack(
              children: [
                const CustomBackground(),
                Positioned(
                  top: 36,
                  right: 0,
                  left: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/profile_picture.png',
                              width: 64,
                            ),
                            Row(
                              children: [
                                badges.Badge(
                                  badgeStyle: const badges.BadgeStyle(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  position: badges.BadgePosition.topEnd(
                                    top: 1,
                                    end: 2,
                                  ),
                                  child: const Icon(
                                    FeatherIcons.bell,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Icon(
                                  FeatherIcons.shoppingBag,
                                  color: Colors.white,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BlocBuilder<AuthenticationBloc,
                                AuthenticationState>(
                              builder: (context, state) => Text(
                                state.username != null
                                    ? 'Hi, ${state.username}'
                                    : 'Hi, Lorem',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Text(
                              'Welcome to MedHub',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Material(
                          elevation: 7,
                          shadowColor: Colors.black.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(56),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(56),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.search,
                                size: 24,
                                color:
                                    const Color(0xff090F47).withOpacity(0.45),
                              ),
                              hintText: 'Search Medicine & Healthcare products',
                              hintStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color(0xff090F47).withOpacity(0.45),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const SizedBox(
                        height: 130,
                        child: CategoryListview(),
                      ),
                      const SizedBox(height: 200, child: Carousel()),
                      const SizedBox(
                        height: 300,
                        child: DealsListview(),
                      ),
                      const SizedBox(height: 24),
                      const SizedBox(
                        height: 300,
                        child: BrandsListview(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
