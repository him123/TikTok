import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok/utils/colors.dart';
import 'package:tiktok/widgets/text.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: ColorUtils.white,
        leading: const Icon(Icons.arrow_back_ios_new_rounded),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'All activity',
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
        centerTitle: true,
        actions: [
          SizedBox(
            width: 22,
            height: 15,
            child: SvgPicture.asset(
              'assets/images/message_send.svg',
              color: ColorUtils.black,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 70,
              height: 68,
              child: SvgPicture.asset(
                'assets/images/message_icon.svg',
                color: const Color(0xffB0B0B3),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Text(
              "Notifications aren't available",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: ColorUtils.textBlue,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            Text(
              'Notifications about your account will appear here',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: ColorUtils.textGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
