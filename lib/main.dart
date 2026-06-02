import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_bridge/core/routes/router_configuration.dart';
import 'package:skill_bridge/core/utils/app_scale.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppScale.init(context);

    final router = ref.watch(RouterConfiguration.routerProvider);

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'SkillBridge',
    //   theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
    //   // home: const SplashScreen(),
    //   // home: const OnboardingScreen(),
    //   home: const ModeSelector(),
    // );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SkillBridge',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      routerConfig: router,
    );
  }
}
