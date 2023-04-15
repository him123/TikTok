import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok/screens/edit_profile.dart';
import 'package:tiktok/screens/setting.dart';
import 'package:tiktok/utils/colors.dart';
import 'package:tiktok/utils/widget_utils.dart';
import 'package:tiktok/widgets/all_tab.dart';
import 'package:tiktok/widgets/like_tab.dart';
import 'package:tiktok/widgets/profile_buttons.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorUtils.white,
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 23,
                      height: 23,
                      child: SvgPicture.asset('assets/images/account.svg'),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Jacob West',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: ColorUtils.textBlue,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                      const Icon(
                        Icons.arrow_drop_down_rounded,
                        color: ColorUtils.textBlue,
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PrivacySetting(),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: Center(
                            child: SvgPicture.asset('assets/images/more.svg')),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            WidgetUtils.vertical(MediaQuery.of(context).size.height * .01),
            const CircleAvatar(
              radius: 35.0,
              backgroundColor: ColorUtils.white,
              backgroundImage: AssetImage(
                'assets/images/profile_pic.png',
              ),
            ),
            WidgetUtils.vertical(MediaQuery.of(context).size.height * .015),
            Text(
              '@jacob_w',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: ColorUtils.textBlue, fontSize: 15),
            ),
            WidgetUtils.vertical(MediaQuery.of(context).size.height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileButtons(
                  number: "14",
                  text: "Following",
                  width: MediaQuery.of(context).size.width * .16,
                ),
                WidgetUtils.horizonral(
                    MediaQuery.of(context).size.width * 0.08),
                ProfileButtons(
                  number: "38",
                  text: "Followers",
                  width: MediaQuery.of(context).size.width * .16,
                ),
                WidgetUtils.horizonral(
                    MediaQuery.of(context).size.width * 0.08),
                ProfileButtons(
                  number: "91",
                  text: 'Likes',
                  width: MediaQuery.of(context).size.width * .16,
                )
              ],
            ),
            WidgetUtils.vertical(MediaQuery.of(context).size.height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfile(),
                      )),
                  child: Container(
                    width: 164,
                    height: 44,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffE3E3E4),
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Text(
                        'Edit Profile',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: ColorUtils.black, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                WidgetUtils.horizonral(5),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffE3E3E4),
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.bookmark_border_outlined,
                      size: 28,
                    ),
                  ),
                )
              ],
            ),
            WidgetUtils.vertical(MediaQuery.of(context).size.height * .02),
            InkWell(
              onTap: () {},
              child: Text(
                'Tap to add bio',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: ColorUtils.textGrey, fontSize: 14),
              ),
            ),
            WidgetUtils.vertical(MediaQuery.of(context).size.height * .02),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .055,
              decoration: BoxDecoration(
                  border: Border.all(
                color: const Color(0xffD0D1D3),
              )),
              child: TabBar(
                controller: controller,
                tabs: [
                  SizedBox(
                    width: 12,
                    height: 14,
                    child: SvgPicture.asset(
                      'assets/images/all_tab.svg',
                      color: controller.index == 0
                          ? ColorUtils.textBlue
                          : ColorUtils.unselectedTab,
                    ),
                  ),
                  SizedBox(
                    width: 19,
                    height: 16,
                    child: SvgPicture.asset(
                      'assets/images/heart_tab.svg',
                      color: controller.index == 1
                          ? ColorUtils.textBlue
                          : ColorUtils.unselectedTab,
                    ),
                  ),
                ],
                indicatorColor: const Color(0xff161722),
                indicator: UnderlineTabIndicator(
                    borderSide: const BorderSide(width: 1.5),
                    insets: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.18)),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * .393,
                child: TabBarView(
                  controller: controller,
                  children: const [AllTabs(), LikeTab()],
                )),
          ],
        )),
      ),
    );
  }
}
