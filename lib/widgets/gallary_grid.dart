import 'package:flutter/material.dart';
import 'package:tiktok/utils/colors.dart';

List<String> images = [
  'image1',
  'image2',
  'image3',
  'image4',
  'image5',
  'image6',
  'image7',
  'image8',
  'image9',
  'image1',
  'image2',
  'image3',
  'image4',
  'image5',
  'image6',
  'image7',
  'image8',
  'image9'
];

class GallaryGrid extends StatelessWidget {
  const GallaryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtils.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .752,
      child: GridView.builder(
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            childAspectRatio: 5 / 6.5,
            mainAxisSpacing: 0),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/${images[index]}.png',
                      ),
                      fit: BoxFit.fill)),
            ),
          );
        },
      ),
    );
  }
}
