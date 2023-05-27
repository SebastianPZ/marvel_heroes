
import 'package:flutter/cupertino.dart';
import 'package:marvel_heroes/domain/useCase/listHeroes.dart';
import 'package:marvel_heroes/presentation/viewModel/heroViewModels/heroViewModel.dart';

class HeroesViewModel with ChangeNotifier {

  final ListHeroesUseCase _listHeroes = ListHeroes();
  List<HeroViewModel> heroes = [];

  Future<void> listHeroes() async {

    var response = await _listHeroes.run().then((heroesList) {
      heroes = heroesList.value!.heroes.map((hero) => HeroViewModel(hero: hero)).toList().cast<HeroViewModel>();
      notifyListeners();
    });

  }

}