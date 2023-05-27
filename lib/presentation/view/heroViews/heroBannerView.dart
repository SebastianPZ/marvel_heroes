
import 'package:flutter/material.dart';
import 'package:marvel_heroes/presentation/viewModel/heroViewModels/heroViewModel.dart';
import 'package:marvel_heroes/util/theme/colors.dart';
import 'package:marvel_heroes/util/theme/textStyles.dart';

class HeroBannerView extends StatelessWidget {
  const HeroBannerView({super.key, required this.hero, required this.backAction});

  final HeroViewModel hero;
  final Future<void> backAction;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.4,
          child: Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.hardEdge,
            color: darkColor,
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20)
                )
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.02,
                        top: size.width * 0.02
                    ),
                    child: IconButton(
                      onPressed: () {
                        backAction.whenComplete(() => Navigator.pop(context));
                      },
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.55),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.network(
                      hero.thumbnail,
                      fit: BoxFit.fitHeight,
                      height: size.height * 0.4,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.03),
                    child: SizedBox(
                      width: size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(hero.name, style: titleHeroStyle(size: size),),
                          Text(hero.description, style: descriptionHeroStyle(size: size),),
                        ].map((item) => Padding(
                            padding: const EdgeInsets.all(5),
                            child: item,
                          ),
                        ).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

}