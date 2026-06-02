import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bridge/core/routes/route_names.dart';
import 'package:skill_bridge/core/routes/router_listenable.dart';
import 'package:skill_bridge/feature/auth/presentation/auth_screen.dart';
import 'package:skill_bridge/feature/home/presentation/home_screen.dart';
import 'package:skill_bridge/feature/modeSelector/presentation/mode_selector.dart';
import 'package:skill_bridge/feature/modeSelector/provider/role_notifier_provider.dart';
import 'package:skill_bridge/core/enums/user_role.dart';
import 'package:skill_bridge/feature/onboarding/presentation/onboarding_screen.dart';
import 'package:skill_bridge/feature/onboarding/provider/onboarding_status_provider.dart';
import 'package:skill_bridge/feature/splash/presentation/splash_screen.dart';
import 'package:skill_bridge/feature/splash/provider/splash_update_status.dart';

class RouterConfiguration {
  static final routerProvider = Provider<GoRouter>((ref) {
    final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey(
      debugLabel: 'root',
    );

    final listenable = RouterListenable(ref);

    return GoRouter(
      initialLocation: '/splash',
      navigatorKey: rootNavigatorKey,
      refreshListenable: listenable,
      debugLogDiagnostics: true,

      redirect: (context, state) {
        final loc = state.matchedLocation;

        final bool isSplashDone = ref.read(splashUpdateStatus);

        final isFirstLaunched = ref
            .read(onboardingStatusProvider.notifier)
            .isFirstLauncheSafe;

        final selectedUser =
            ref.read(roleNotifierProvider).value ?? UserRole.unselected;

        if (!isSplashDone) {
          return loc == '/splash' ? null : '/splash';
        }

        if (isFirstLaunched) {
          return loc == '/onboarding' ? null : '/onboarding';
        }

        if (selectedUser == UserRole.unselected) {
          return loc == '/role' ? null : '/role';
        }

        final isAuthenticated = false; // remove this later

        if (!isAuthenticated) {
          return loc == '/auth' ? null : '/auth';
        }
      },

      routes: <RouteBase>[
        GoRoute(
          path: '/${RouteNames.splashRoute}',
          name: RouteNames.splashRoute,
          builder: (context, state) => const SplashScreen(),
        ),

        GoRoute(
          path: '/${RouteNames.onboardingRoute}',
          name: RouteNames.onboardingRoute,
          builder: (context, state) => const OnboardingScreen(),
        ),

        GoRoute(
          path: '/${RouteNames.roleSelectorRoute}',
          name: RouteNames.roleSelectorRoute,
          builder: (context, state) => const ModeSelector(),
        ),

        GoRoute(
          path: '/${RouteNames.authRoute}',
          name: RouteNames.authRoute,
          builder: (context, state) => const AuthScreen(),
        ),

        GoRoute(
          path: '/${RouteNames.homeroute}',
          name: RouteNames.homeroute,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  });
}
