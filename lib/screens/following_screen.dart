import 'package:flutter/material.dart';
import 'package:tiktok/widgets/actions_toolbar.dart';
import 'package:tiktok/widgets/video_description.dart';
import 'package:tiktok/widgets/video_tile.dart';

class FollowingPage extends StatelessWidget {
  const FollowingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 5,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const VideoTile(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                VideoDescription(),
                Expanded(
                    child: ActionsToolbar(
                  isFollowing: true,
                ))
              ],
            )
          ],
        );
      },
    );
  }
}
