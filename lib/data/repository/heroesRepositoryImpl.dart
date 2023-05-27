
import 'package:marvel_heroes/data/models/response/baseResponseModel.dart';
import 'package:marvel_heroes/util/customResult/customError.dart';
import 'package:marvel_heroes/util/customResult/customResult.dart';

import '../../domain/entities/baseResponse.dart';
import '../../domain/entities/heroes.dart';
import '../../domain/repository/heroesRepository.dart';
import '../models/response/heroesModel.dart';
import '../network/apiConfig.dart';


class HeroesRepositoryImpl extends HeroesRepository {

  final ApiConfig _apiConfig;

  HeroesRepositoryImpl({ApiConfig? apiConfig}) : _apiConfig = apiConfig ?? ApiConfig();

  @override
  Future<CustomResult<BaseResponse<Heroes>, CustomError>> listHeroes() async {

    try {

      var response = await _apiConfig.getHeroes();

      if(response.statusCode == 200) {
        return CustomResult.onSuccess(BaseResponseModel<HeroesModel>.fromJson(response.data).toEntity<Heroes>());
      } else {
        return CustomResult.onError(GenericError.fromMessage(errorMessage: "Error end data"));
      }

    } catch(e) {
      return CustomResult.onError(HttpError.fromCode(code: 500));
    }

  }

}