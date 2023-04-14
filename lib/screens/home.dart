import 'package:flutter/material.dart';
import 'package:tiktok/cubit/home_tab/cubit/tabs_cubit.dart';
import 'package:tiktok/utils/colors.dart';
import 'package:tiktok/widgets/actions_toolbar.dart';
import 'package:tiktok/widgets/text.dart';
import 'package:tiktok/widgets/video_description.dart';
import 'package:tiktok/widgets/video_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  bool isFollowingSelected = false;
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorUtils.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorUtils.transparent,
        title: BlocConsumer<TabsCubit, TabsState>(
          listener: (context, state) {
            if (state is Tabs) {
              selectedIndex = state.selectedTabIndex;
              if (selectedIndex == 0) {
                isFollowingSelected = true;
              } else {
                isFollowingSelected = false;
              }
            }
          },
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<TabsCubit>().selectedTab(0);
                  },
                  child: TextWidget(
                    text: 'Following',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: isFollowingSelected ? 15 : 14,
                        color: isFollowingSelected
                            ? ColorUtils.white
                            : ColorUtils.grey),
                  ),
                ),
                TextWidget(
                  text: "  |  ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 14, color: ColorUtils.grey),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<TabsCubit>().selectedTab(1);
                  },
                  child: TextWidget(
                    text: 'For you',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: isFollowingSelected == false ? 15 : 14,
                        color: isFollowingSelected == false
                            ? ColorUtils.white
                            : ColorUtils.grey),
                  ),
                )
              ],
            );
          },
        ),
      ),
      body: PageView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoTile(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  VideoDescription(),
                  Expanded(child: ActionsToolbar())
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
