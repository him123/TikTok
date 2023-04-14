import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tiktok/utils/colors.dart';
import 'package:tiktok/widgets/text.dart';

class VideoDescription extends StatelessWidget {
  const VideoDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
          //height: MediaQuery.of(context).size.height / 9,
          padding: const EdgeInsets.only(left: 20.0, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextWidget(
                text: '@firstjonny',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 15,
                    color: ColorUtils.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              ExpandableText(
                'Video title and some other stuff',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 13,
                      color: ColorUtils.white,
                    ),
                expandText: 'more',
                collapseText: 'less',
                expandOnTextTap: true,
                collapseOnTextTap: true,
                maxLines: 2,
                linkColor: ColorUtils.grey,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.music_note,
                    size: 15.0,
                    color: ColorUtils.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    height: 20,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Marquee(
                      text: 'audio name  .',
                      velocity: 8,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 13,
                            color: ColorUtils.white,
                          ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
