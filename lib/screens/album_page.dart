import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok/utils/colors.dart';
import 'package:tiktok/widgets/album_title.dart';
import 'package:tiktok/widgets/gallary_grid.dart';
import 'package:tiktok/widgets/text.dart';
import 'package:tiktok/widgets/use_sound_widget.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorUtils.transparent,
        leadingWidth: 35,
        leading: SizedBox(
          child: Center(
            child: SvgPicture.asset(
              'assets/images/back.svg',
              height: 20,
            ),
          ),
        ),
        actions: [
          SvgPicture.asset('assets/images/share_icon.svg'),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const AlbumTitle(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                const GallaryGrid(),
              ],
            ),
          ),
          const UseSoundWidget()
        ],
      ),
    );
  }
}
