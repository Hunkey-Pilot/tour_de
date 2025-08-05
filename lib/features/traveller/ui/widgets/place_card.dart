import 'package:flutter/material.dart';

import '../../../../app/assests_path.dart';

class place_card extends StatelessWidget {
  const place_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: 180,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              AssetsPath.placeDemoImage,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.yellow, size: 18),
                      Icon(Icons.star, color: Colors.yellow, size: 18),
                      Icon(Icons.star, color: Colors.yellow, size: 18),
                      Icon(Icons.star, color: Colors.yellow, size: 18),
                      Icon(Icons.star, color: Colors.yellow, size: 18),
                    ],
                  ),
                  Text(
                    "Tanguar Haor",
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cursive',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}