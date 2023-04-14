import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok/utils/colors.dart';
import 'package:tiktok/utils/size.dart';
import 'package:tiktok/widgets/text.dart';

class ActionsToolbar extends StatefulWidget {
  const ActionsToolbar({super.key});

  @override
  State<ActionsToolbar> createState() => _ActionsToolbarState();
}

class _ActionsToolbarState extends State<ActionsToolbar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 13, color: ColorUtils.white);

    return Container(
      width: 100,
      padding: const EdgeInsets.only(right: 3),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            getFollowAction(profileUrl: ''),
            getSocialAction(icon: 'heart', title: '3.2m', style: style),
            getSocialAction(icon: 'comment', title: '16.4k', style: style),
            getSocialAction(icon: 'share', title: 'Share', style: style),
            getMusicPlayerAction(),
          ]),
    );
  }

  Widget getSocialAction(
      {required String title, required String icon, required TextStyle style}) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      width: 60.0,
      height: 60.0,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/$icon.svg',
            width: 25,
            height: 25,
          ),
          SizedBox(
            height: 5,
          ),
          TextWidget(
            text: title,
            style: style,
          )
        ],
      ),
    );
    // return Container(
    //   margin: const EdgeInsets.only(top: 15.0),
    //   width: 60.0,
    //   height: 60.0,
    //   child: Column(
    //     children: [
    //       Icon(
    //         icon,
    //         size: isShare ? 25.0 : 35.0,
    //         color: Colors.grey[300],
    //       ),
    //       Padding(
    //         padding: EdgeInsets.only(top: isShare ? 5.0 : 2.0),
    //         child: TextWidget(
    //           text: title,
    //           fontSize: isShare ? 10.0 : 12.0,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget getFollowAction({required String profileUrl}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: 60.0,
      height: 60.0,
      child: Stack(
        children: [getProfilePicture(), getPlusIcon()],
      ),
    );
  }

  Widget getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((SizeUtils.ActionWidgetSize / 2) - (SizeUtils.PlusIconSize / 2)),
      child: Container(
        width: SizeUtils.PlusIconSize,
        height: SizeUtils.PlusIconSize,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 43, 84),
            borderRadius: BorderRadius.circular(15)),
        child: const Icon(
          Icons.add,
          color: ColorUtils.white,
          size: 20.0,
        ),
      ),
    );
  }

  Widget getProfilePicture() {
    return Positioned(
      left: (SizeUtils.ActionWidgetSize / 2) - (SizeUtils.ProfileImageSize / 2),
      child: Container(
        padding: const EdgeInsets.all(1.0),
        height: SizeUtils.ProfileImageSize,
        width: SizeUtils.ProfileImageSize,
        decoration: BoxDecoration(
          color: ColorUtils.white,
          borderRadius: BorderRadius.circular(SizeUtils.ProfileImageSize / 2),
        ),
        child: const CircleAvatar(
          backgroundImage:
              NetworkImage('https://picsum.photos/id/1062/400/400'),
        ),
      ),
    );
  }

  LinearGradient musicGradiant() {
    return LinearGradient(colors: [
      Colors.grey[800]!,
      Colors.grey[900]!,
      Colors.grey[900]!,
      Colors.grey[800]!
    ], stops: const [
      0.0,
      0.4,
      0.6,
      1.0
    ], begin: Alignment.bottomLeft, end: Alignment.topRight);
  }

  Widget getMusicPlayerAction() {
    return AnimatedBuilder(
        animation: animationController,
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          width: SizeUtils.ActionWidgetSize,
          height: SizeUtils.ActionWidgetSize,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(11.0),
                height: SizeUtils.ProfileImageSize,
                width: SizeUtils.ProfileImageSize,
                decoration: BoxDecoration(
                    gradient: musicGradiant(),
                    borderRadius:
                        BorderRadius.circular(SizeUtils.ProfileImageSize / 2)),
                child: Image.network(
                    'https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7'),
              )
            ],
          ),
        ),
        builder: (context, child) {
          return Transform.rotate(
              angle: 2 * pi * animationController.value, child: child);
        });
  }
}
