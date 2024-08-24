import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medhub/features/authentication/presentation/pages/authentication_page.dart';
import 'package:medhub/features/authentication/presentation/pages/onboarding_page.dart';
import 'package:medhub/features/authentication/presentation/pages/otp_page.dart';
import 'package:medhub/features/authentication/presentation/pages/verification_success_page.dart';
import 'package:medhub/features/authentication/presentation/pages/welcome_page.dart';
import 'package:medhub/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:medhub/features/cart/presentation/pages/cart_page.dart';
import 'package:medhub/features/cart/presentation/pages/checkout_page.dart';
import 'package:medhub/features/cart/presentation/pages/payment_success.dart';
import 'package:medhub/features/categories/presentation/pages/category_details_page.dart';
import 'package:medhub/features/categories/presentation/pages/product_detail_page.dart';
import 'package:medhub/features/home/presentation/pages/home_page.dart';
import 'package:medhub/features/profile/pages/profile_page.dart';
import 'package:medhub/scaffold_page.dart';
import 'package:medhub/splash_screen.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorHome =
    GlobalKey(debugLabel: 'shell');
final GlobalKey<NavigatorState> _shellNavigatorNotification =
    GlobalKey(debugLabel: 'shell');
final GlobalKey<NavigatorState> _shellNavigatorAdd =
    GlobalKey(debugLabel: 'shell');
final GlobalKey<NavigatorState> _shellNavigatorCart =
    GlobalKey(debugLabel: 'shell');
final GlobalKey<NavigatorState> _shellNavigatorProfile =
    GlobalKey(debugLabel: 'shell');

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  navigatorKey: _rootNavigator,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/welcome',
      name: 'welcome',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/authentication',
      name: 'authentication',
      builder: (context, state) => AuthenticationPage(
        authenticationPageExtra: state.extra as AuthenticationPageExtra,
      ),
      routes: [
        GoRoute(
          path: 'otp',
          name: 'otp',
          builder: (context, state) => OtpPage(
            otpPageExtra: state.extra as OtpPageExtra,
          ),
        ),
        GoRoute(
          path: 'success',
          name: 'success',
          builder: (context, state) => const VerificationSuccessPage(),
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => ScaffoldPage(
        navigationShell: navigationShell,
      ),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHome,
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: 'category-details',
                  name: 'category-details',
                  builder: (context, state) => const CategoryDetailsPage(),
                  routes: [
                    GoRoute(
                      path: ':id',
                      name: 'product-details',
                      builder: (context, state) => ProductDetailPage(
                        productDetailPageExtra:
                            state.extra as ProductDetailPageExtra,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorNotification,
          routes: [
            GoRoute(
              path: '/notification',
              name: 'notification',
              pageBuilder: (context, state) =>
                  const MaterialPage(child: Placeholder()),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAdd,
          routes: [
            GoRoute(
              path: '/add',
              name: 'add',
              pageBuilder: (context, state) =>
                  const MaterialPage(child: Placeholder()),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCart,
          routes: [
            GoRoute(
              path: '/cart',
              name: 'cart',
              builder: (context, state) {
                context.read<CartBloc>().add(GetCartItems());
                return const CartPage();
              },
              routes: [
                GoRoute(
                  path: 'checkout',
                  name: 'checkout',
                  builder: (context, state) => CheckoutPage(
                    checkoutPageExtra: state.extra as CheckoutPageExtra,
                  ),
                ),
                GoRoute(
                  path: 'payment-success',
                  name: 'payment-success',
                  builder: (context, state) => const PaymentSuccess(),
                )
              ],
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfile,
          routes: [
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => const ProfilePage(),
            )
          ],
        ),
      ],
    ),
  ],
);
