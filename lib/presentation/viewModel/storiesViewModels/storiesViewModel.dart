
import 'package:flutter/cupertino.dart';
import 'package:marvel_heroes/domain/useCase/listStoriesByHero.dart';
import 'package:marvel_heroes/presentation/viewModel/storiesViewModels/storyViewModel.dart';

class StoriesViewModel extends ChangeNotifier{

  final ListStoriesByHeroUseCase _listStoriesByHero = ListStoriesByHero();
  List<StoryViewModel> stories = [];

  bool loading = true;

  Future<void> listStoriesByHero({required int heroId}) async {

    var response = await _listStoriesByHero.run(heroId: heroId).then((storiesList) {
      stories = storiesList.value!.stories.map((story) => StoryViewModel(story: story)).toList().cast<StoryViewModel>();
      loading = false;
      notifyListeners();
    });

  }

  void clean() {
    if(stories.isNotEmpty) stories.clear();
    loading = true;
  }

}