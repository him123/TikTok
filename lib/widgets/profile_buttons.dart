import 'package:flutter/material.dart';
import 'package:tiktok/utils/colors.dart';

class ProfileButtons extends StatelessWidget {
  final String number;
  final String text;
  final double width;
  const ProfileButtons(
      {super.key,
      required this.number,
      required this.text,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Text(
            number,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: ColorUtils.textBlue, fontSize: 17),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(text,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: ColorUtils.textGrey,
                  fontSize: 13,
                  fontStyle: FontStyle.normal))
        ],
      ),
    );
  }
}
