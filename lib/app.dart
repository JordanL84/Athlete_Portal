import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/careers/career_detail_screen.dart';
import 'screens/careers/career_overview_screen.dart';
import 'screens/careers/careers_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/survey/survey_screen.dart';

class AthletePortalApp extends StatelessWidget {
  const AthletePortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Athlete Portal',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        SignupScreen.routeName: (_) => const SignupScreen(),
        SurveyScreen.routeName: (_) => const SurveyScreen(),
        DashboardScreen.routeName: (_) => DashboardScreen(),
        CareersScreen.routeName: (_) => const CareersScreen(),
        CareerOverviewScreen.routeName: (_) => const CareerOverviewScreen(),
        CareerDetailScreen.routeName: (_) => const CareerDetailScreen(),
      },
    );
  }
}