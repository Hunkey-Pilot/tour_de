import 'package:flutter/material.dart';
import 'package:tour_de/features/traveller/ui/screens/booking_screens/booking_details_screen.dart';
import 'package:tour_de/features/traveller/ui/screens/booking_screens/booking_user_information_screen.dart';
import 'package:tour_de/features/traveller/ui/screens/vehicle_details_screen/bus_details_screen.dart';
import 'package:tour_de/features/traveller/ui/screens/auth_screen/traveller_auth_screen.dart';
import 'package:tour_de/features/traveller/ui/screens/traveller_tab_bar_screens/traveller_tab_bar_screen.dart';
import '../features/home/ui/screens/home_screen.dart';
import '../features/home/ui/screens/splash_screen.dart';


class AppRoutes{
  static Route<dynamic> getRoutes(RouteSettings settings){
    late final Widget ScreenWidget;
    if(settings.name == SplashScreen.name){
      ScreenWidget = SplashScreen();
    } else if(settings.name == HomeScreen.name){
      ScreenWidget = HomeScreen();
    } else if(settings.name == TravellerAuthScreen.name){
      ScreenWidget = TravellerAuthScreen();
    } else if(settings.name == TravellerTabBarScreen.name){
      ScreenWidget = TravellerTabBarScreen();
    } else if(settings.name == BookingDetailsScreen.name){
      ScreenWidget = BookingDetailsScreen();
    } else if(settings.name == BookingUserInformationScreen.name){
      ScreenWidget = BookingUserInformationScreen();
    } else if(settings.name == BusDetailsScreen.name){
      ScreenWidget = BusDetailsScreen();
    }


    return MaterialPageRoute(builder: (context) => ScreenWidget);
  }
}