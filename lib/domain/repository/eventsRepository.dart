
import '../../util/customResult/customError.dart';
import '../../util/customResult/customResult.dart';
import '../entities/baseResponse.dart';
import '../entities/events.dart';

abstract class EventsRepository {

  Future<CustomResult<BaseResponse<Events>, CustomError>> listEventsByHero({required int heroId});

}