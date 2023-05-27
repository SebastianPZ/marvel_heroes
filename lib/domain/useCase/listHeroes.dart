
import 'package:marvel_heroes/data/repository/heroesRepositoryImpl.dart';
import 'package:marvel_heroes/util/customResult/customError.dart';
import 'package:marvel_heroes/util/customResult/customResult.dart';

import '../entities/heroes.dart';
import '../repository/heroesRepository.dart';

abstract class ListHeroesUseCase {

  Future<CustomResult<Heroes, CustomError>> run();

}

class ListHeroes extends ListHeroesUseCase {

  final HeroesRepository _heroesRepository;

  ListHeroes({HeroesRepository? heroesRepository}) : _heroesRepository = heroesRepository ?? HeroesRepositoryImpl();

  @override
  Future<CustomResult<Heroes, CustomError>> run() async {
    try {
      var result = await _heroesRepository.listHeroes();
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