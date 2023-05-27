
import 'package:flutter/cupertino.dart';
import 'package:marvel_heroes/domain/useCase/listEventsByHero.dart';

import 'eventViewModel.dart';

class EventsViewModel extends ChangeNotifier{

  final ListEventsByHeroUseCase _listEventsByHero = ListEventsByHero();
  List<EventViewModel> events = [];

  bool loading = true;

  Future<void> listEventsByHero({required int heroId}) async {

    var response = await _listEventsByHero.run(heroId: heroId).then((eventsList) {
      events = eventsList.value!.events.map((event) => EventViewModel(event: event)).toList().cast<EventViewModel>();
      loading = false;
      notifyListeners();
    });

  }

  void clean() {
    if(events.isNotEmpty) events.clear();
    loading = true;
  }

}