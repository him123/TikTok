import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok/utils/colors.dart';

class BottomToolbar extends StatelessWidget {
  final int selectedPageIndex;
  final Function onTap;
  const BottomToolbar(
      {super.key, required this.selectedPageIndex, required this.onTap});

  // static const double NavigationIconSize = 20.0;
  // static const double CreateButtonWidth = 38.0;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _bottomBarNavItem(0, 'Home', style, 'home'),
        _bottomBarNavItem(1, 'Discover', style, 'search'),
        _addVideoNavItem(context),
        _bottomBarNavItem(2, 'Inbox', style, 'message'),
        _bottomBarNavItem(3, 'Me', style, 'profile')
      ],
    );

    //   return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    //     Column(
    //       children: const [
    //         Icon(
    //           TikTokIcons.home,
    //           color: ColorUtils.white,
    //           size: NavigationIconSize,
    //         ),
    //         SizedBox(
    //           height: 05,
    //         ),
    //         TextWidget(
    //           text: 'Home',
    //           fontSize: 12,
    //         )
    //       ],
    //     ),
    //     Column(
    //       children: const [
    //         Icon(
    //           TikTokIcons.search,
    //           color: ColorUtils.white,
    //           size: NavigationIconSize,
    //         ),
    //         SizedBox(
    //           height: 05,
    //         ),
    //         TextWidget(
    //           text: 'Discover',
    //           fontSize: 12,
    //         )
    //       ],
    //     ),
    //     customCreateIcon(),
    //     Column(
    //       children: const [
    //         Icon(
    //           TikTokIcons.messages,
    //           color: ColorUtils.white,
    //           size: NavigationIconSize,
    //         ),
    //         SizedBox(
    //           height: 05,
    //         ),
    //         TextWidget(
    //           text: 'Inbox',
    //           fontSize: 12,
    //         )
    //       ],
    //     ),
    //     Column(
    //       children: const [
    //         Icon(
    //           TikTokIcons.profile,
    //           color: ColorUtils.white,
    //           size: NavigationIconSize,
    //         ),
    //         SizedBox(
    //           height: 05,
    //         ),
    //         TextWidget(
    //           text: 'Me',
    //           fontSize: 12,
    //         )
    //       ],
    //     )
    //   ]);
    // }

    // customCreateIcon() {
    //   return Container(
    //     width: 45.0,
    //     height: 27.0,
    //     alignment: Alignment.topCenter,
    //     child: Stack(
    //       children: [
    //         Container(
    //           margin: const EdgeInsets.only(left: 10.0),
    //           width: CreateButtonWidth,
    //           decoration: BoxDecoration(
    //             color: const Color.fromARGB(255, 250, 45, 108),
    //             borderRadius: BorderRadius.circular(7.0),
    //           ),
    //         ),
    //         Container(
    //           margin: const EdgeInsets.only(right: 10.0),
    //           width: CreateButtonWidth,
    //           decoration: BoxDecoration(
    //               color: const Color.fromARGB(255, 32, 211, 234),
    //               borderRadius: BorderRadius.circular(7.0)),
    //         ),
    //         Center(
    //           child: Container(
    //             height: double.infinity,
    //             width: CreateButtonWidth,
    //             decoration: BoxDecoration(
    //                 color: ColorUtils.white,
    //                 borderRadius: BorderRadius.circular(7.0)),
    //             child: const Icon(
    //               Icons.add,
    //               size: 20.0,
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   );
  }

  _bottomBarNavItem(
      int index, String label, TextStyle textStyle, String iconName) {
    bool isSelected = selectedPageIndex == index;
    Color iconAndTextColor = isSelected ? ColorUtils.black : ColorUtils.grey;

    if (isSelected && selectedPageIndex == 0) {
      iconAndTextColor = ColorUtils.white;
    } else if (isSelected && selectedPageIndex == 1) {
      iconAndTextColor = ColorUtils.white;
    } else if (isSelected && selectedPageIndex == 2) {
      iconAndTextColor = ColorUtils.white;
    } else if (isSelected && selectedPageIndex == 3) {
      iconAndTextColor = ColorUtils.white;
    }

    return GestureDetector(
      onTap: () => {onTap(index)},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/images/$iconName.svg',
            color: iconAndTextColor,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            label,
            style: textStyle.copyWith(color: iconAndTextColor),
          )
        ],
      ),
    );
  }

  _addVideoNavItem(BuildContext context) {
    return Container(
      width: 45,
      height: MediaQuery.of(context).size.height * .03,
      //height: 27,
      child: SvgPicture.asset('assets/images/add.svg'),
    );
  }
}
