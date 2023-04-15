import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok/utils/colors.dart';

class SettingInfo extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  const SettingInfo(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      dense: true,
      leading: SizedBox(
        width: 18,
        height: 18,
        child: SvgPicture.asset(
          'assets/images/$icon.svg',
          fit: BoxFit.fill,
        ),
      ),
      horizontalTitleGap: 0,
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: ColorUtils.textBlue, fontSize: 15)),
      trailing: InkWell(
        onTap: onTap,
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 15,
          color: ColorUtils.textGrey,
        ),
      ),
    );
  }
}
