
import '../../util/customResult/customError.dart';
import '../../util/customResult/customResult.dart';
import '../entities/baseResponse.dart';
import '../entities/comics.dart';

abstract class ComicsRepository {

  Future<CustomResult<BaseResponse<Comics>, CustomError>> listComicsByHero({required int heroId});

}