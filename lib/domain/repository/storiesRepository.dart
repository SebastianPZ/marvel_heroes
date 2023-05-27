
import '../../util/customResult/customError.dart';
import '../../util/customResult/customResult.dart';
import '../entities/baseResponse.dart';
import '../entities/stories.dart';

abstract class StoriesRepository {

  Future<CustomResult<BaseResponse<Stories>, CustomError>> listStoriesByHero({required int heroId});

}