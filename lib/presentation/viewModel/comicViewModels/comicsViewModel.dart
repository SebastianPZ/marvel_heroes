
import 'package:flutter/cupertino.dart';
import 'package:marvel_heroes/domain/useCase/listComicsByHero.dart';
import 'package:marvel_heroes/presentation/viewModel/comicViewModels/comicViewModel.dart';

class ComicsViewModel extends ChangeNotifier{

  final ListComicsByHeroUseCase _listComicsByHero = ListComicsByHero();
  List<ComicViewModel> comics = [];

  bool loading = true;

  Future<void> listComicsByHero({required int heroId}) async {

    var response = await _listComicsByHero.run(heroId: heroId).then((comicsList) {
      comics = comicsList.value!.comics.map((comic) => ComicViewModel(comic: comic)).toList().cast<ComicViewModel>();
      loading = false;
      notifyListeners();
    });

  }

  void clean() {
    if(comics.isNotEmpty) comics.clear();
    loading = true;
  }

}