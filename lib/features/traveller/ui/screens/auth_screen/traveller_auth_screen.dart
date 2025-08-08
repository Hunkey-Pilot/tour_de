import 'package:flutter/material.dart';
import 'package:tour_de/app/app_colors.dart';

import '../../../../common/widget/app_logo.dart';
import '../../widgets/login_signup_nav_bar.dart';

class TravellerAuthScreen extends StatefulWidget {
  const TravellerAuthScreen({super.key});
  static final String name = '/traveller-auth';

  @override
  State<TravellerAuthScreen> createState() => _TravellerAuthScreenState();
}

class _TravellerAuthScreenState extends State<TravellerAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor.withOpacity(.8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              AppLogo(height: 280),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: LoginSignUpSwitcher(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
