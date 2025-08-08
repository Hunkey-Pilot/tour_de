import 'package:flutter/material.dart';
import 'package:tour_de/app/app_colors.dart';
import 'package:tour_de/app/assests_path.dart';
import 'package:tour_de/features/common/widget/user_profile_avatar.dart';

import '../../widgets/post_card.dart';

class SocialMediaPageScreen extends StatefulWidget {
  const SocialMediaPageScreen({super.key});

  @override
  State<SocialMediaPageScreen> createState() => _SocialMediaPageScreenState();
}

class _SocialMediaPageScreenState extends State<SocialMediaPageScreen> {

  //TODO : green color on stories

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
              const Text(
                "Stories",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              _buildStoryList(),
              const SizedBox(height: 24),
              const Text(
                "Feed",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add_circle_outline),
                  hintText: "Add Your Tour",
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
              const SizedBox(height: 24),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), //it is use when I want that listview will not scroll alone
                itemCount: 20,
                  itemBuilder: (context,index){
                    return PostCard();
                  },
                  separatorBuilder: (context,index){
                    return SizedBox(height: 12,);
                  },
                  ),
              const SizedBox(height: 8,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoryList() {
    return SizedBox(
            height: 80,
            child: Row(
              children: [
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      if(index == 0){
                        return CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_circle_outline_rounded,
                              size: 80,
                            ),
                            splashRadius: 40,
                            padding: EdgeInsets.zero,
                          ),
                        );
                      } else{
                        return userProfileAvatar(40);
                      }

                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 5);
                    },
                  ),
                ),
              ],
            ),
          );
  }
}


