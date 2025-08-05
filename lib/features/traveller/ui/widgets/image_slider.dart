import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tour_de/app/assests_path.dart';

import '../../../../app/app_colors.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key,});


  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  final ValueNotifier<int> _currentSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 280,viewportFraction: 1,
              onPageChanged: (int _currentIndex,_){
                _currentSlider.value = _currentIndex;
              }, autoPlay: true
          ),

          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.red,
                    borderRadius: BorderRadius.circular(14)
                  ),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      AssetsPath.countryDemoImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _currentSlider,
              builder: (context, index,_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    for(int i = 0; i < 5 ;i++)
                      Container(
                        width: 12,
                        height: 12,
                        margin: EdgeInsets.only(left: 3),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: .5),
                          borderRadius: BorderRadius.circular(8),
                          color:
                          _currentSlider.value == i ? AppColors.themeColor : Colors.white,
                        ),
                      )
                  ],
                );
              }
          ),
        )

      ],
    );
  }
}