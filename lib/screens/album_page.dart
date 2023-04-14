import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tiktok/utils/colors.dart';
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
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .03,
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/images/rectangle.png'),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                            text: 'The Round',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: ColorUtils.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        TextWidget(
                          text: 'Roddy Roundicch',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: ColorUtils.textGrey,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .005,
                        ),
                        TextWidget(
                          text: '17M Videos',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: ColorUtils.textGrey,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .016,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .35,
                          height: MediaQuery.of(context).size.height * .03,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorUtils.textGrey.withOpacity(.5)),
                              borderRadius: BorderRadius.circular(3)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.bookmark_border_outlined,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              TextWidget(
                                text: 'Add to Favorites',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: ColorUtils.black, fontSize: 12),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                Container(
                  color: ColorUtils.black,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .752,
                ),
              ],
            ),
          ),
          const UseSoundWidget()
        ],
      ),
    );
  }
}
