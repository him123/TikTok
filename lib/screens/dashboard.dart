import 'package:flutter/material.dart';
import 'package:tiktok/screens/add.dart';
import 'package:tiktok/screens/home.dart';
import 'package:tiktok/screens/inbox.dart';
import 'package:tiktok/screens/profile.dart';
import 'package:tiktok/screens/search.dart';
import 'package:tiktok/utils/colors.dart';
import 'package:tiktok/widgets/actions_toolbar.dart';
import 'package:tiktok/widgets/bottom_toolbar.dart';
import 'package:tiktok/widgets/text.dart';
import 'package:tiktok/widgets/video_description.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  static List<Widget> tabs = [
    const Home(
      key: PageStorageKey('Page1'),
    ),
    const Search(
      key: PageStorageKey('Page2'),
    ),
    const Inbox(
      key: PageStorageKey('Page3'),
    ),
    const Profile(
      key: PageStorageKey('Page4'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.black,
      // body: Column(
      //   children: [topSection(), middleSection(), const BottomToolbar()],
      // ),
      body: PageStorage(
        bucket: bucket,
        child: tabs[selectedIndex],
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * .06,
        child: BottomToolbar(
          selectedPageIndex: selectedIndex,
          onTap: onTap,
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  topSection() {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(bottom: 15.0),
      alignment: const Alignment(0.0, 1.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: const [
          TextWidget(
            text: 'Following',
          ),
          SizedBox(
            width: 15.0,
          ),
          TextWidget(
            text: 'For You',
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }

  middleSection() {
    return Expanded(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        VideoDescription(),
        ActionsToolbar(
          isFollowing: false,
        )
      ],
    ));
  }
}
