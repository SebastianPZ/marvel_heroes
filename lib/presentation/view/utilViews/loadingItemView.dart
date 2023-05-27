
import 'package:flutter/material.dart';

import '../../../util/theme/colors.dart';

class LoadingItemView extends StatelessWidget {
  const LoadingItemView({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.24,
      width: size.width * 0.26,
      child: Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        color: shimmerDarkColor,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(size.width * 0.03)
            )
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: shimmerLightColor,
                height: size.height * 0.6,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: size.width * 0.5,
                height: size.height * 0.09,
                color: shimmerDarkColor,
                child: Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}