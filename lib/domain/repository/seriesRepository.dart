
import '../../util/customResult/customError.dart';
import '../../util/customResult/customResult.dart';
import '../entities/baseResponse.dart';
import '../entities/seriesList.dart';

abstract class SeriesRepository {

  Future<CustomResult<BaseResponse<SeriesList>, CustomError>> listSeriesByHero({required int heroId});

}