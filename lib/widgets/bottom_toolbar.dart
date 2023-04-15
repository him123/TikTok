import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok/screens/add.dart';
import 'package:tiktok/utils/colors.dart';

class BottomToolbar extends StatefulWidget {
  final int selectedPageIndex;
  final Function onTap;
  const BottomToolbar(
      {super.key, required this.selectedPageIndex, required this.onTap});

  @override
  State<BottomToolbar> createState() => _BottomToolbarState();
}

class _BottomToolbarState extends State<BottomToolbar> {
  bool isOntap = false;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10);

    return Container(
      color:
          widget.selectedPageIndex == 0 ? ColorUtils.black : ColorUtils.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _bottomBarNavItem(0, 'Home', style,
              widget.selectedPageIndex == 0 ? 'home' : 'home_outline'),
          _bottomBarNavItem(1, 'Discover', style, 'search'),
          _addVideoNavItem(context, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddPost(),
                ));
          }, widget.selectedPageIndex),
          _bottomBarNavItem(2, 'Inbox', style,
              widget.selectedPageIndex == 2 ? 'inbox_filled' : 'message'),
          _bottomBarNavItem(3, 'Me', style,
              widget.selectedPageIndex == 3 ? 'profile_filled' : 'profile')
        ],
      ),
    );
  }

  _bottomBarNavItem(
      int index, String label, TextStyle textStyle, String iconName) {
    bool isSelected = widget.selectedPageIndex == index;
    Color iconAndTextColor = isSelected ? ColorUtils.black : ColorUtils.grey;

    if (isSelected && widget.selectedPageIndex == 0) {
      iconAndTextColor = ColorUtils.white;
    }
    //else if (isSelected && widget.selectedPageIndex == 1) {
    //   iconAndTextColor = ColorUtils.white;
    // } else if (isSelected && widget.selectedPageIndex == 2) {
    //   iconAndTextColor = ColorUtils.white;
    // } else if (isSelected && widget.selectedPageIndex == 3) {
    //   iconAndTextColor = ColorUtils.white;
    // }

    return GestureDetector(
      onTap: () => {widget.onTap(index)},
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

  _addVideoNavItem(BuildContext context, VoidCallback ontap, int index) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 45,
        height: MediaQuery.of(context).size.height * .03,
        //height: 27,
        child: SvgPicture.asset(
            'assets/images/${index != 0 ? 'add_black' : 'add'}.svg'),
      ),
    );
  }
}
