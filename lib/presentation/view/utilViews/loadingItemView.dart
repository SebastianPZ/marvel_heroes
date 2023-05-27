
import 'package:flutter/material.dart';

import '../../../util/theme/colors.dart';

class LoadingItemView extends StatelessWidget {
  const LoadingItemView({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.22,
      width: size.width * 0.25,
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
                padding: const EdgeInsets.only(left: 10, top: 10),
                width: size.width * 0.5,
                height: size.height * 0.08,
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