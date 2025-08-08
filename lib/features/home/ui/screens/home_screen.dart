import 'package:flutter/material.dart';
import 'package:tour_de/app/assests_path.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour_de/features/common/widget/app_logo.dart';
import 'package:tour_de/features/traveller/ui/screens/auth_screen/traveller_auth_screen.dart';

import '../../../../app/app_colors.dart';
import '../../../common/widget/social_icon_button.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static final String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 32,),
                  AppLogo(width: 420,),
                  SizedBox(height: 28,),
                  ElevatedButton(
                      onPressed: _onTapTravellerButton,
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromWidth(320),
                        backgroundColor: AppColors.themeColor,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        )
                      ),
                      child: Text("TRAVELLER",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        letterSpacing: 1.2
                      ),)),
                  const SizedBox(height: 4,),
                  ElevatedButton(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(320),
                          backgroundColor: Colors.redAccent.shade100,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          )
                      ),
                      child: Text("AGENCY OWNER",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          letterSpacing: 1.2
                      ),)),
                  const SizedBox(height: 4,),
                  ElevatedButton(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromWidth(320),
                          backgroundColor: Colors.greenAccent,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          )
                      ),
                      child: Text("HOTEL OWNER",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          letterSpacing: 1.2
                      ),)),
                  const SizedBox(height: 32,),
                  Row(
                        children: [
                           Expanded(
                             child: Divider(
                              endIndent: 8,
                              height: 1,
                                                 ),
                           ),
                          Text("Need more? Join"),
                          Expanded(child: Divider(
                            indent: 8,
                          )),
                        ],
                      ),
                  const SizedBox(height: 16,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      buildSocialIcon(
                          icon: FontAwesomeIcons.facebook,
                          color: Colors.blue,
                          onTap: (){}
                      ),
                      const SizedBox(width: 24,),
                      buildSocialIcon(
                          icon: FontAwesomeIcons.twitter,
                          color: Colors.blue,
                          onTap: (){}
                      ),
                      const SizedBox(width: 24,),
                      buildSocialIcon(
                          icon: FontAwesomeIcons.google,
                          color: Colors.blue,
                          onTap: (){}
                      )
                  ],
                  )
                    ],
              ),
            ),
          ),
      ),
    );
  }




  void _onTapTravellerButton(){
      Navigator.pushNamed(context, TravellerAuthScreen.name);
  }
}
