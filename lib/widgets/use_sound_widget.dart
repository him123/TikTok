import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok/widgets/text.dart';

class UseSoundWidget extends StatelessWidget {
  const UseSoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .05),
        child: Container(
          width: MediaQuery.of(context).size.width * .45,
          height: MediaQuery.of(context).size.height * .05,
          decoration: BoxDecoration(
              color: const Color(0xffEA4359),
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/camera.svg'),
              const SizedBox(
                width: 5,
              ),
              TextWidget(
                text: 'Use this sound',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
