
import 'package:marvel_heroes/data/repository/comicsRepositoryImpl.dart';
import 'package:marvel_heroes/domain/entities/comics.dart';
import 'package:marvel_heroes/domain/repository/comicsRepository.dart';

import '../../util/customResult/customError.dart';
import '../../util/customResult/customResult.dart';

abstract class ListComicsByHeroUseCase {

  Future<CustomResult<Comics, CustomError>> run({required int heroId});

}

class ListComicsByHero extends ListComicsByHeroUseCase {

  final ComicsRepository _comicsRepository;

  ListComicsByHero({ComicsRepository? comicsRepository}) : _comicsRepository = comicsRepository ?? ComicsRepositoryImpl();

  @override
  Future<CustomResult<Comics, CustomError>> run({required int heroId}) async {
    try {
      var result = await _comicsRepository.listComicsByHero(heroId: heroId);
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