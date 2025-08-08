import 'package:flutter/material.dart';
import 'package:tour_de/app/app_colors.dart';
import 'package:tour_de/features/traveller/ui/widgets/post_card.dart';

class TrendingPageScreen extends StatefulWidget {
  const TrendingPageScreen({super.key});

  @override
  State<TrendingPageScreen> createState() => _TrendingPageScreenState();
}

class _TrendingPageScreenState extends State<TrendingPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return PostCard();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 8,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
