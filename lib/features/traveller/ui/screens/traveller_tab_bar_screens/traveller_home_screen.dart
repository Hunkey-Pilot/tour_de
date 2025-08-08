import 'package:flutter/material.dart';
import 'package:tour_de/app/assests_path.dart';
import 'package:tour_de/features/traveller/ui/screens/vehicle_details_screen/bus_details_screen.dart';
import 'package:tour_de/features/traveller/ui/widgets/hotel_card.dart';
import 'package:tour_de/features/traveller/ui/widgets/vehicle_card.dart';
import '../../../../../app/app_colors.dart';
import '../../widgets/place_card.dart';

class TravellerHomeScreen extends StatefulWidget {
  const TravellerHomeScreen({super.key});

  @override
  State<TravellerHomeScreen> createState() => _TravellerHomeScreenState();
}

class _TravellerHomeScreenState extends State<TravellerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: AppColors.themeColor),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Places",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.green,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Cursive',
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return place_card();
                },
              ),
              const SizedBox(height: 12),
              const Text(
                "Hotels",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.green,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Cursive',
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return hotelCard();
                },
              ),
              const Text(
                "Vehicles",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.green,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Cursive',
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector
                    (
                    onTap: _onTapBusCard,
                      child: vehicleCard()
                  );
                },
              ),


            ],
          ),
        ),
      ),
    );
  }
  void _onTapBusCard(){
    Navigator.pushNamed(context, BusDetailsScreen.name);
  }
}
