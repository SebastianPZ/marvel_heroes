
import 'package:marvel_heroes/data/models/response/storiesModel.dart';
import 'package:marvel_heroes/domain/entities/baseResponse.dart';
import 'package:marvel_heroes/domain/entities/stories.dart';
import 'package:marvel_heroes/domain/repository/storiesRepository.dart';
import 'package:marvel_heroes/util/customResult/customError.dart';
import 'package:marvel_heroes/util/customResult/customResult.dart';

import '../models/response/baseResponseModel.dart';
import '../network/apiConfig.dart';

class StoriesRepositoryImpl extends StoriesRepository {

  final ApiConfig _apiConfig;

  StoriesRepositoryImpl({ApiConfig? apiConfig}) : _apiConfig = apiConfig ?? ApiConfig();

  @override
  Future<CustomResult<BaseResponse<Stories>, CustomError>> listStoriesByHero({required int heroId}) async {
    try {

      var response = await _apiConfig.getStoriesByHero(heroId: heroId);

      if(response.statusCode == 200) {
        return CustomResult.onSuccess(BaseResponseModel<StoriesModel>.fromJson(response.data).toEntity<Stories>());
      } else {
        return CustomResult.onError(GenericError.fromMessage(errorMessage: "Error end data"));
      }

    } catch(e) {
      return CustomResult.onError(HttpError.fromCode(code: 500));
    }
  }

}