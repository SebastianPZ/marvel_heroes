
import '../../util/customResult/customError.dart';
import '../../util/customResult/customResult.dart';
import '../entities/baseResponse.dart';
import '../entities/heroes.dart';

abstract class HeroesRepository {

  Future<CustomResult<BaseResponse<Heroes>, CustomError>> listHeroes();

}