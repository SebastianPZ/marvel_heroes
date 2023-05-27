
import 'package:flutter/cupertino.dart';
import 'package:marvel_heroes/domain/useCase/listSeriesByHero.dart';
import 'package:marvel_heroes/presentation/viewModel/seriesViewModels/seriesViewModel.dart';

class SeriesListViewModel extends ChangeNotifier{

  final ListSeriesByHeroUseCase _listSeriesByHero = ListSeriesByHero();
  List<SeriesViewModel> series = [];

  bool loading = true;

  Future<void> listSeriesByHero({required int heroId}) async {

    var response = await _listSeriesByHero.run(heroId: heroId).then((seriesList) {
      series = seriesList.value!.series.map((series) => SeriesViewModel(series: series)).toList().cast<SeriesViewModel>();
      loading = false;
      notifyListeners();
    });

  }

  void clean() {
    if(series.isNotEmpty) series.clear();
    loading = true;
  }

}