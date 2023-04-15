import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tiktok/utils/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
        title: Text('Edit profile',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 17,
                  color: ColorUtils.textBlue,
                )),
      ),
    );
  }
}
