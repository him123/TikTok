import 'package:flutter/material.dart';
import 'package:tiktok/utils/colors.dart';
import 'package:tiktok/widgets/gallary_grid.dart';

class AllTabs extends StatelessWidget {
  const AllTabs({super.key});

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
