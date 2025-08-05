import 'package:flutter/material.dart';
import 'package:tour_de/app/app_routes.dart';
import 'package:tour_de/app/app_theme.dart';
import '../features/home/ui/screens/splash_screen.dart';

class TourDe extends StatefulWidget {
  const TourDe({super.key});

  @override
  State<TourDe> createState() => _TourDeState();
}

class _TourDeState extends State<TourDe> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       initialRoute: SplashScreen.name,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.getRoutes,
      theme: AppTheme.lightThemeData
    );
  }
}
