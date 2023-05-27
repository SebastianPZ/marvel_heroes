
import 'package:marvel_heroes/data/repository/storiesRepositoryImpl.dart';
import 'package:marvel_heroes/domain/entities/stories.dart';
import 'package:marvel_heroes/domain/repository/storiesRepository.dart';

import '../../util/customResult/customError.dart';
import '../../util/customResult/customResult.dart';

abstract class ListStoriesByHeroUseCase {

  Future<CustomResult<Stories, CustomError>> run({required int heroId});

}

class ListStoriesByHero extends ListStoriesByHeroUseCase {

  final StoriesRepository _storiesRepository;

  ListStoriesByHero({StoriesRepository? storiesRepository}) : _storiesRepository = storiesRepository ?? StoriesRepositoryImpl();

  @override
  Future<CustomResult<Stories, CustomError>> run({required int heroId}) async {
    try {
      var result = await _storiesRepository.listStoriesByHero(heroId: heroId);
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