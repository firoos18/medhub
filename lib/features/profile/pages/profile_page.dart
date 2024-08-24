import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medhub/features/authentication/presentation/bloc/authentication_bloc.dart';

class SettingsItemEntity {
  final String imagePath;
  final String title;

  const SettingsItemEntity({required this.imagePath, required this.title});
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<SettingsItemEntity> items = [
    const SettingsItemEntity(
      imagePath: 'assets/images/account.png',
      title: 'Private Account',
    ),
    const SettingsItemEntity(
      imagePath: 'assets/images/consults.png',
      title: 'My Consults',
    ),
    const SettingsItemEntity(
      imagePath: 'assets/images/orders.png',
      title: 'My Orders',
    ),
    const SettingsItemEntity(
      imagePath: 'assets/images/billing.png',
      title: 'Billing',
    ),
    const SettingsItemEntity(
      imagePath: 'assets/images/faq.png',
      title: 'Faq',
    ),
    const SettingsItemEntity(
      imagePath: 'assets/images/settings.png',
      title: 'Settings',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Profile',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Image.asset('assets/images/profile_picture.png'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        return Text(
                          state.username != null
                              ? 'Hi, ${state.username!}'
                              : 'Hi, Lorem Ipsum',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      },
                    ),
                    Text(
                      'Welcome to MedHub',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff091C3F).withOpacity(0.45),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Flexible(
              fit: FlexFit.loose,
              child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Divider(
                    thickness: 1,
                    color: const Color(0xff091C3F).withOpacity(0.08),
                  ),
                ),
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(items[index].imagePath),
                          const SizedBox(width: 16),
                          Text(
                            items[index].title,
                            style: GoogleFonts.hankenGrotesk(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff091C3F).withOpacity(0.75),
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        FeatherIcons.chevronRight,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
