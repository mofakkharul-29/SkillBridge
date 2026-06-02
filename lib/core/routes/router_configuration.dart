import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bridge/core/routes/route_names.dart';
import 'package:skill_bridge/feature/auth/presentation/auth_screen.dart';
import 'package:skill_bridge/feature/home/presentation/home_screen.dart';
import 'package:skill_bridge/feature/modeSelector/presentation/mode_selector.dart';
import 'package:skill_bridge/feature/onboarding/presentation/onboarding_screen.dart';
import 'package:skill_bridge/feature/splash/presentation/splash_screen.dart';

class RouterConfiguration {
  static final routerProvider = Provider<GoRouter>((ref) {
    final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey(
      debugLabel: 'root',
    );

    return GoRouter(
      initialLocation: '/splash',
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: true,

      redirect: (context, state) {
        final fullPath = state.fullPath;
        final currentPath = state.uri.path;
        final matched = state.matchedLocation;

        debugPrint(
          'full path: $fullPath\ncurrentPath: $currentPath\nmatched: $matched',
        );

        if (currentPath != '/splash') {
          return '/splash';
        } 

        

        return null;
        
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
