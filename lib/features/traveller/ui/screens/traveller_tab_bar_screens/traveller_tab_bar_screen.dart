import 'package:flutter/material.dart';
import 'package:tour_de/features/traveller/ui/screens/traveller_tab_bar_screens/booking_page_screen.dart';
import 'package:tour_de/features/traveller/ui/screens/traveller_tab_bar_screens/social_media_page_screen.dart';
import 'package:tour_de/features/traveller/ui/screens/auth_screen/traveller_auth_screen.dart';
import 'package:tour_de/features/traveller/ui/screens/traveller_tab_bar_screens/traveller_home_screen.dart';
import 'package:tour_de/features/traveller/ui/screens/traveller_tab_bar_screens/trending_page_screen.dart';

import '../../../../common/widget/user_profile_avatar.dart';

class TravellerTabBarScreen extends StatefulWidget {
  const TravellerTabBarScreen({super.key});

  static final String name ='/traveller-tab-bar';

  @override
  State<TravellerTabBarScreen> createState() => _TravellerTabBarScreenState();
}

class _TravellerTabBarScreenState extends State<TravellerTabBarScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Traveller"),
        titleSpacing: 1.2,
      actions: [
        userProfileAvatar(20),
        const SizedBox(width: 8,),
      ],
      bottom: TabBar(
          controller: _tabController,
          tabs: [
        Tab(icon: Icon(Icons.home,size: 30,)),
        Tab(icon: Icon(Icons.wifi,size: 30,),),
        Tab(icon: Icon(Icons.local_fire_department_outlined,size: 30,),),
        Tab(icon: Icon(Icons.airplanemode_on_outlined,size: 30,),)
      ]
      ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            _drawerButton(context, Icons.next_plan, "My Plans"),
            _drawerButton(context,Icons.create,"Create Plan"),
            _drawerButton(context,Icons.house,"Hotel"),
            _drawerButton(context,Icons.directions_bus,"Vehicle"),
            _drawerButton(context,Icons.favorite_outline,"Wishlist"),
            SizedBox(height: 380),
            ElevatedButton(onPressed: _onTapLogOutButton,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.withOpacity(0.3)
                ),
                child: Text("Log out",
              style: TextStyle(
                color: Colors.red
              ),))

          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
          children:
          [
            TravellerHomeScreen(),
            SocialMediaPageScreen(),
            TrendingPageScreen(),
            BookingPageScreen()
          ]
      ),
    );
  }

  Widget _drawerButton(BuildContext context,IconData icon,String title) {
    return GestureDetector(
      onTap: (){
        print("$title Tapped");
        Navigator.pop(context);
      },
      child: ListTile(
              leading: Icon(icon),
              title: Text(title),
            ),
    );
  }
  void _onTapLogOutButton(){
    Navigator.pushNamedAndRemoveUntil(context, TravellerAuthScreen.name, (predicate) =>false);
  }
}

