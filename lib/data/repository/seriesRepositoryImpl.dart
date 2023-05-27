
import 'package:marvel_heroes/data/models/response/seriesListModel.dart';
import 'package:marvel_heroes/domain/entities/baseResponse.dart';
import 'package:marvel_heroes/domain/entities/seriesList.dart';
import 'package:marvel_heroes/domain/repository/seriesRepository.dart';
import 'package:marvel_heroes/util/customResult/customError.dart';
import 'package:marvel_heroes/util/customResult/customResult.dart';

import '../models/response/baseResponseModel.dart';
import '../network/apiConfig.dart';

class SeriesRepositoryImpl extends SeriesRepository {

  final ApiConfig _apiConfig;

  SeriesRepositoryImpl({ApiConfig? apiConfig}) : _apiConfig = apiConfig ?? ApiConfig();

  @override
  Future<CustomResult<BaseResponse<SeriesList>, CustomError>> listSeriesByHero({required int heroId}) async {
    try {

      var response = await _apiConfig.getSeriesByHero(heroId: heroId);

      if(response.statusCode == 200) {
        return CustomResult.onSuccess(BaseResponseModel<SeriesListModel>.fromJson(response.data).toEntity<SeriesList>());
      } else {
        return CustomResult.onError(GenericError.fromMessage(errorMessage: "Error end data"));
      }

    } catch(e) {
      return CustomResult.onError(HttpError.fromCode(code: 500));
    }
  }

}