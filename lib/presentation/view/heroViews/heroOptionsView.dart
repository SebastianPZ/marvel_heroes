
import 'package:flutter/material.dart';
import 'package:marvel_heroes/presentation/viewModel/comicViewModels/comicsViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/eventViewModels/eventsViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/heroViewModels/heroViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/seriesViewModels/seriesListViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/storiesViewModels/storiesViewModel.dart';
import 'package:marvel_heroes/util/theme/colors.dart';
import 'package:marvel_heroes/util/theme/textStyles.dart';
import 'package:provider/provider.dart';

import '../../viewModel/heroViewModels/heroDetailViewModel.dart';

class HeroOptionsView extends StatefulWidget {
  const HeroOptionsView({super.key});
  
  @override
  State<StatefulWidget> createState() => _HeroOptionsViewState();
  
}

class _HeroOptionsViewState extends State<HeroOptionsView> with
  TickerProviderStateMixin{

  late TabController _optionsController;

  @override
  void initState() {
    _optionsController = TabController( length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Consumer<HeroDetailViewModel>(
      builder: (context, heroDetail, _) {
        return Container(
          color: darkColor,
          width: size.width * 0.8,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BoxDecoration(
              border: Border(
                top: BorderSide(
                    color: primaryColor,
                    width: 3.0
                ),
              ),
            ),
            onTap: (index) => _setSelectedOption(option: heroDetail.options[index], hero: heroDetail.hero),
            dividerColor: Colors.grey,
            labelStyle: optionSelectedStyle(size: size),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            padding: EdgeInsets.zero,
            indicatorColor: primaryColor,
            controller: _optionsController,
            tabs: List.generate(heroDetail.options.length, (index) =>
              Tab(text: _optionName(option: heroDetail.options[index]))
            )
          ),
        );
      }
    );
  }

  void _setSelectedOption({required Option option, required HeroViewModel hero}) {
    context.read<HeroDetailViewModel>().setSelectedOption(selectedOption: option);

    switch(option) {
      case Option.comics:
        context.read<ComicsViewModel>().listComicsByHero(heroId: hero.id);
        break;
      case Option.events:
        context.read<EventsViewModel>().listEventsByHero(heroId: hero.id);
        break;
      case Option.series:
        context.read<SeriesListViewModel>().listSeriesByHero(heroId: hero.id);
        break;
      case Option.stories:
        context.read<StoriesViewModel>().listStoriesByHero(heroId: hero.id);
        break;
      default:
        break;
    }

  }

  String _optionName({required Option option}) {
    switch(option) {
      case Option.comics:
        return "Comics";
      case Option.events:
        return "Events";
      case Option.series:
        return "Series";
      case Option.stories:
        return "Stories";
      default:
        return "Option not supported";
    }
  }

}