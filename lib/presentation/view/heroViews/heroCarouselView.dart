
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:marvel_heroes/presentation/view/heroViews/heroCarouselItemView.dart';
import 'package:marvel_heroes/presentation/viewModel/heroViewModels/heroViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/heroViewModels/heroesViewModel.dart';
import 'package:provider/provider.dart';

class HeroCarouselView extends StatefulWidget {
  const HeroCarouselView({super.key});

  @override
  State<StatefulWidget> createState() => _HeroCarouselViewState();

}

class _HeroCarouselViewState extends State<HeroCarouselView> {

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Selector<HeroesViewModel, List<HeroViewModel>>(
      selector: (context, viewModel) => viewModel.heroes,
      builder: (context, heroes, _) {
        return heroes.isEmpty ?
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No hay heroes")
          ],
        ) :
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: CarouselSlider(
            items: List.generate(heroes.length, (index) =>
                HeroCarouselItemView(hero: heroes[index])),
            options: CarouselOptions(
              height: size.height * 0.75,
              enableInfiniteScroll: false
            )
          ),
        );
      }
    );
  }

}