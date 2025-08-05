import 'package:flutter/material.dart';

import '../../../../app/assests_path.dart';
import '../../../common/widget/user_profile_avatar.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
  });



  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _isLiked = false;
  int _like = 0;

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                userProfileAvatar(28),
                const SizedBox(width: 2,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sathil Reza Shuvo",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Text("Sajek Valley.1 hour ago",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 4,),
            Text("Loved this place❤.This is the place I never will be forget",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6,),
            Image.asset(AssetsPath.placeDemoImage,),
            const SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$_like people like this",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Text("2.5k shares",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      setState((){
                        _isLiked = !_isLiked;
                        if(_isLiked == true){
                          _like++;
                        }
                        else{
                          _like--;
                        }
                      });
                    },
                    icon: Icon(
                      _isLiked ? Icons.favorite : Icons.favorite_outline,
                      color: _isLiked ? Colors.red : Colors.black,
                    )
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.chat_bubble_outline)),
                IconButton(onPressed: (){}, icon: Icon(Icons.share)),
                IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border)),
              ],
            )



          ],
        ),
      ),
    );
  }
}