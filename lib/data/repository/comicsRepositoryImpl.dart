
import 'package:marvel_heroes/data/models/response/comicsModel.dart';
import 'package:marvel_heroes/domain/entities/baseResponse.dart';
import 'package:marvel_heroes/domain/entities/comics.dart';
import 'package:marvel_heroes/domain/repository/comicsRepository.dart';
import 'package:marvel_heroes/util/customResult/customError.dart';
import 'package:marvel_heroes/util/customResult/customResult.dart';

import '../models/response/baseResponseModel.dart';
import '../network/apiConfig.dart';

class ComicsRepositoryImpl extends ComicsRepository {

  final ApiConfig _apiConfig;

  ComicsRepositoryImpl({ApiConfig? apiConfig}) : _apiConfig = apiConfig ?? ApiConfig();

  @override
  Future<CustomResult<BaseResponse<Comics>, CustomError>> listComicsByHero({required int heroId}) async {

    try {

      var response = await _apiConfig.getComicsByHero(heroId: heroId);

      if(response.statusCode == 200) {
        return CustomResult.onSuccess(BaseResponseModel<ComicsModel>.fromJson(response.data).toEntity<Comics>());
      } else {
        return CustomResult.onError(GenericError.fromMessage(errorMessage: "Error end data"));
      }

    } catch(e) {
      return CustomResult.onError(HttpError.fromCode(code: 500));
    }

  }

}