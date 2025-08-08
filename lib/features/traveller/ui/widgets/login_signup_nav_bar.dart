import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tour_de/features/traveller/controller/login_signup_controller.dart';
import 'package:tour_de/features/traveller/ui/screens/auth_screen/login_screen.dart';
import 'package:tour_de/features/traveller/ui/screens/auth_screen/signup_screen.dart';


class LoginSignUpSwitcher extends StatelessWidget {
  LoginSignUpSwitcher({super.key});

  final List<Widget> screens = [
    LoginScreen(),
    SignUpScreen() // Use your actual SignUp screen
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginSignUpNavBarController>(
      init: LoginSignUpNavBarController(),
      builder: (navController) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => navController.changeIndex(0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: navController.selectedIndex == 0
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: navController.selectedIndex == 0
                                ? FontWeight.bold
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => navController.changeIndex(1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: navController.selectedIndex == 1
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: navController.selectedIndex == 1
                                ? FontWeight.bold
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: screens[navController.selectedIndex],
            ),
          ],
        );
      },
    );
  }
}
