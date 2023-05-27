
import 'package:flutter/material.dart';
import 'package:marvel_heroes/presentation/view/heroViews/heroDetailView.dart';
import 'package:marvel_heroes/presentation/viewModel/heroViewModels/heroDetailViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/heroViewModels/heroViewModel.dart';
import 'package:marvel_heroes/util/theme/colors.dart';
import 'package:marvel_heroes/util/theme/textStyles.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HeroCarouselItemView extends StatelessWidget {
  const HeroCarouselItemView({super.key, required this.hero});

  final HeroViewModel hero;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Card(
      margin: EdgeInsets.all(size.width * 0.05),
      elevation: 10,
      clipBehavior: Clip.hardEdge,
      color: primaryColor,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50)
        )
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.network(
              hero.thumbnail,
              fit: BoxFit.fitHeight,
              height: size.height * 0.6,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => _navigateToHeroDetail(context: context, hero: hero),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 20),
                width: size.width * 0.8,
                height: size.height * 0.15,
                color: Colors.black,
                child: Text(
                  hero.name,
                  style: marvelMainHeroNameStyle(size: size),),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _navigateToHeroDetail({required BuildContext context, required HeroViewModel hero}) {

    context.read<HeroDetailViewModel>().setSelectedHero(selectedHero: hero);

    Navigator.push(
        context,
        PageTransition(
            duration: const Duration(milliseconds: 200),
            reverseDuration: const Duration(milliseconds: 200),
            type: PageTransitionType.rightToLeft,
            child: const HeroDetailView()
        )
    );

  }

}