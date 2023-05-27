
import 'package:flutter/cupertino.dart';
import 'package:marvel_heroes/presentation/viewModel/heroViewModels/heroViewModel.dart';

enum Option {comics, events, series, stories}

class HeroDetailViewModel extends ChangeNotifier {

  late HeroViewModel hero;

  Option option = Option.comics;

  List<Option> options = [
    Option.comics,
    Option.events,
    Option.series,
    Option.stories
  ];

  void setSelectedHero({required HeroViewModel selectedHero}) {
    hero = selectedHero;
    notifyListeners();
  }

  void setSelectedOption({required Option selectedOption}) {
    option = selectedOption;
    notifyListeners();
  }

}