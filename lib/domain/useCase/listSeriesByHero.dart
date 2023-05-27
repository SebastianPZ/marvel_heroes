
import 'package:marvel_heroes/data/repository/seriesRepositoryImpl.dart';
import 'package:marvel_heroes/domain/entities/seriesList.dart';
import 'package:marvel_heroes/domain/repository/seriesRepository.dart';

import '../../util/customResult/customError.dart';
import '../../util/customResult/customResult.dart';

abstract class ListSeriesByHeroUseCase {

  Future<CustomResult<SeriesList, CustomError>> run({required int heroId});

}

class ListSeriesByHero extends ListSeriesByHeroUseCase {

  final SeriesRepository _seriesRepository;

  ListSeriesByHero({SeriesRepository? seriesRepository}) : _seriesRepository = seriesRepository ?? SeriesRepositoryImpl();

  @override
  Future<CustomResult<SeriesList, CustomError>> run({required int heroId}) async {
    try {
      var result = await _seriesRepository.listSeriesByHero(heroId: heroId);
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