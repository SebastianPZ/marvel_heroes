
import 'package:flutter/material.dart';
import 'package:marvel_heroes/presentation/viewModel/seriesViewModels/seriesViewModel.dart';

import '../../../util/theme/colors.dart';
import '../../../util/theme/textStyles.dart';

class SeriesItemView extends StatelessWidget {
  const SeriesItemView({super.key, required this.series});

  final SeriesViewModel series;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.24,
      width: size.width * 0.26,
      child: Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        color: darkColor,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(size.width * 0.03)
            )
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.network(
                series.thumbnail,
                fit: BoxFit.fitHeight,
                height: size.height * 0.6,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: size.width * 0.5,
                height: size.height * 0.09,
                color: Colors.black,
                child: Text(
                  series.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionHeroStyle(size: size),),
              ),
            )
          ],
        ),
      ),
    );
  }
}