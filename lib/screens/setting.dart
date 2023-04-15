import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok/utils/colors.dart';
import 'package:tiktok/utils/widget_utils.dart';
import 'package:tiktok/widgets/divider.dart';
import 'package:tiktok/widgets/settings_info.dart';

class PrivacySetting extends StatefulWidget {
  const PrivacySetting({super.key});

  @override
  State<PrivacySetting> createState() => _PrivacySettingState();
}

class _PrivacySettingState extends State<PrivacySetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        backgroundColor: ColorUtils.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorUtils.black,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Text('Privacy and settings',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 17,
                  color: ColorUtils.textBlue,
                )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetUtils.vertical(MediaQuery.of(context).size.height * .02),
              Text(
                'ACCOUNT',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: ColorUtils.textGrey, fontSize: 13),
              ),
              SettingInfo(
                  icon: 'manage_account',
                  title: 'Manage my account',
                  onTap: () {}),
              SettingInfo(
                  icon: 'privacy', title: 'Privacy and safety', onTap: () {}),
              SettingInfo(
                  icon: 'content', title: 'Content preferences', onTap: () {}),
              SettingInfo(icon: 'balance', title: 'Balance', onTap: () {}),
              SettingInfo(
                  icon: 'share_profile', title: 'Share profile', onTap: () {}),
              SettingInfo(icon: 'qr', title: 'TikCode', onTap: () {}),
              const DividerWidget(),
              WidgetUtils.vertical(MediaQuery.of(context).size.height * .02),
              Text(
                'GENERAL',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: ColorUtils.textGrey, fontSize: 13),
              ),
              SettingInfo(
                  icon: 'notification',
                  title: 'Push notifications',
                  onTap: () {}),
              SettingInfo(icon: 'language', title: 'Language', onTap: () {}),
              SettingInfo(
                  icon: 'well', title: 'Digital Wellbeing', onTap: () {}),
              SettingInfo(
                  icon: 'accessibility', title: 'Accessibility', onTap: () {}),
              SettingInfo(icon: 'data', title: 'Data saver', onTap: () {}),
              const DividerWidget(),
              WidgetUtils.vertical(MediaQuery.of(context).size.height * .02),
              Text(
                'SUPPORT',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: ColorUtils.textGrey, fontSize: 13),
              ),
              SettingInfo(
                  icon: 'report', title: 'Report a problem', onTap: () {}),
              SettingInfo(icon: 'help', title: 'Help center', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
