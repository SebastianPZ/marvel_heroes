
import 'package:marvel_heroes/domain/entities/baseResponse.dart';
import 'package:marvel_heroes/domain/entities/events.dart';
import 'package:marvel_heroes/domain/repository/eventsRepository.dart';
import 'package:marvel_heroes/util/customResult/customError.dart';
import 'package:marvel_heroes/util/customResult/customResult.dart';

import '../models/response/baseResponseModel.dart';
import '../models/response/eventsModel.dart';
import '../network/apiConfig.dart';

class EventsRepositoryImpl extends EventsRepository {

  final ApiConfig _apiConfig;

  EventsRepositoryImpl({ApiConfig? apiConfig}) : _apiConfig = apiConfig ?? ApiConfig();

  @override
  Future<CustomResult<BaseResponse<Events>, CustomError>> listEventsByHero({required int heroId}) async {

    try {

      var response = await _apiConfig.getEventsByHero(heroId: heroId);

      if(response.statusCode == 200) {
        return CustomResult.onSuccess(BaseResponseModel<EventsModel>.fromJson(response.data).toEntity<Events>());
      } else {
        return CustomResult.onError(GenericError.fromMessage(errorMessage: "Error end data"));
      }

    } catch(e) {
      return CustomResult.onError(HttpError.fromCode(code: 500));
    }

  }

}