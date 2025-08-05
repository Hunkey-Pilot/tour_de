import 'package:flutter/material.dart';
import 'package:tour_de/app/app_colors.dart';
import 'package:tour_de/app/assests_path.dart';

import '../widgets/booking_details.dart';

class BookingPageScreen extends StatefulWidget {
  const BookingPageScreen({super.key});

  @override
  State<BookingPageScreen> createState() => _BookingPageScreenState();
}

class _BookingPageScreenState extends State<BookingPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Create Your Tour Plan",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle_outline_rounded,
                      size: 60,
                    ),
                    splashRadius: 30,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context,index) {
                  return bookingDetails();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 8,);
                },

              )
            ],
          ),
        ),
      ),
    );
  }


}


