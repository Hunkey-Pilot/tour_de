import 'package:flutter/material.dart';
import 'package:tour_de/features/traveller/ui/screens/booking_screens/booking_details_screen.dart';

import '../../../../app/assests_path.dart';

class bookingDetails extends StatelessWidget {
  const bookingDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, BookingDetailsScreen.name);
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            _image_location_details(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dual City Adventure 5 Days 4 Nights in Kathmandu and Pokhara",
                    style: TextStyle(
                        fontSize: 19.5, color: Colors.grey.shade900),
                  ),
                  Text(
                    "BDT 25,000",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Per Person",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _image_location_details() {
  return Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14), topRight: Radius.circular(14)),
        child: Image.asset(
          AssetsPath.countryDemoImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200, // adjust height as needed
        ),
      ),
      Positioned(
        top: 8,
        left: 8,
        child: SizedBox(
          width: 90,
          height: 38,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
            color: Colors.black.withOpacity(0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.location_on_rounded, color: Colors.green),
                Text(
                  "Nepal",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 8,
        left: 8,
        right: 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "5 days 4 nights",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                "2 People",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
