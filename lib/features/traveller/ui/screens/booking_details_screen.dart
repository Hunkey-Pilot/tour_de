import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tour_de/app/app_colors.dart';
import 'package:tour_de/app/assests_path.dart';
import 'package:tour_de/features/common/widget/user_profile_avatar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tour_de/features/traveller/ui/screens/booking_user_information_screen.dart';
import 'package:tour_de/features/traveller/ui/widgets/image_slider.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  static String name ='/booking-details';

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  final List<String> holidaySpots = [
    'Pokhara',
    'Sarankot',
    'Swayambhunath Stupa (Monkey Temple)',
    'Kathmandu Durbar Square (Basantapur Durbar Square)',
    'Davis Fall',
    'Gupteswor Mahadev Cave',
    'Seti River Gorge',
    'Phewa Lake',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      appBar: AppBar(
        title: Text("Tour Details"),
        actions: [
          userProfileAvatar(20)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                     children: [
                       SizedBox(height: 4,),
                       ImageSlider(),
                       SizedBox(height: 10,),
                       _detailsCard(),
                     ],
                ),
              ),
            ),
          ),

        ],
      ),
      
    );
  }

  Widget _detailsCard() {
    return SizedBox(
                 width: double.maxFinite,
                 child: SizedBox(
                   width: double.infinity,
                   child: Card(
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                     elevation: 2,
                     child: Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Starting From",
                               style: TextStyle(color: Colors.orange, fontSize: 14)),
                           Text("BDT 25000",
                               style: TextStyle(
                                   color: Colors.green,
                                   fontSize: 28,
                                   fontWeight: FontWeight.bold)),
                           Text("Per Person",
                               style: TextStyle(color: Colors.black45, fontSize: 13)),
                           Divider(thickness: 0.8, height: 24),

                           Row(
                             children: const [
                               Icon(Icons.location_on_outlined, size: 22, color: Colors.green),
                               SizedBox(width: 6),
                               Text("Holiday Package Spots",
                                   style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 14,
                                       fontWeight: FontWeight.w500)),
                             ],
                           ),
                           SizedBox(height: 8),
                           ...holidaySpots.map(
                                 (spot) => Padding(
                               padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 20),
                               child: Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text('• ', style: TextStyle(fontSize: 16)),
                                   Expanded(
                                     child: Text(
                                       overflow: TextOverflow.ellipsis,
                                       spot,
                                       style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),

                           SizedBox(height: 16),


                           Row(
                             children: const [
                               Icon(Icons.watch_later_outlined, size: 22, color: Colors.green),
                               SizedBox(width: 6),
                               Text("Holiday Package Duration",
                                   style: TextStyle(fontSize: 14,
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold,)),
                             ],
                           ),
                           SizedBox(height: 4),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 28.0),
                             child: Text("5 Days 4 Nights",
                                 style: TextStyle(fontSize: 14, color: Colors.grey[800])),
                           ),

                           SizedBox(height: 16),


                           Row(
                             children: const [
                               Icon(Icons.person, size: 22, color: Colors.green),
                               SizedBox(width: 6),
                               Text("Number of People",
                                   style: TextStyle(fontSize: 14,
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold,),
                               )
                             ],
                           ),
                           SizedBox(height: 4),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 28),
                             child: Text("2", style: TextStyle(fontSize: 14, color: Colors.grey[800])),
                           ),

                           SizedBox(height: 16),

                           Row(
                             children: const [
                               Icon(Icons.directions_bus_filled_outlined,
                                   size: 22, color: Colors.green),
                               SizedBox(width: 6),
                            Text("Pickup",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                           ),
                           SizedBox(height: 4),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 28.0),
                             child: Text("Kathmandu Airport",
                                 style: TextStyle(fontSize: 14, color: Colors.grey[800])),
                           ),
                           GestureDetector(
                             onTap: () {
                               Navigator.pushNamed(context, BookingUserInformationScreen.name);
                             },
                             child: Container(
                               width: double.infinity,
                               padding: EdgeInsets.symmetric(vertical: 14),
                               margin: EdgeInsets.only(top: 8),
                               decoration: BoxDecoration(
                                 color: Colors.green,
                                 borderRadius: BorderRadius.circular(8),
                               ),
                               alignment: Alignment.center,
                               child: Text(
                                 "Book your Holiday Package",
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),

               );
  }
}
