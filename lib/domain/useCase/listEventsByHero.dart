
import 'package:marvel_heroes/data/repository/eventsRepositoryImpl.dart';
import 'package:marvel_heroes/domain/entities/events.dart';
import 'package:marvel_heroes/domain/repository/eventsRepository.dart';

import '../../util/customResult/customError.dart';
import '../../util/customResult/customResult.dart';

abstract class ListEventsByHeroUseCase {

  Future<CustomResult<Events, CustomError>> run({required int heroId});

}

class ListEventsByHero extends ListEventsByHeroUseCase {

  final EventsRepository _eventsRepository;

  ListEventsByHero({EventsRepository? eventsRepository}) : _eventsRepository = eventsRepository ?? EventsRepositoryImpl();

  @override
  Future<CustomResult<Events, CustomError>> run({required int heroId}) async {
    try {
      var result = await _eventsRepository.listEventsByHero(heroId: heroId);
      if(result.success) {
        return CustomResult.onSuccess(result.value!.data.results);
      } else {
        return CustomResult.onError(GenericError.fromMessage(errorMessage: ""));
      }
    } catch(e) {
      return CustomResult.onError(HttpError.fromCode(code: 500));
    }
  }

}