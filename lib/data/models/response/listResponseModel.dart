
import 'package:marvel_heroes/data/models/response/templateModel.dart';
import 'package:marvel_heroes/domain/entities/comics.dart';
import 'package:marvel_heroes/domain/entities/heroes.dart';
import 'package:marvel_heroes/domain/entities/listResponse.dart';
import 'package:marvel_heroes/domain/entities/seriesList.dart';
import 'package:marvel_heroes/domain/entities/stories.dart';

import '../../../domain/entities/events.dart';
import '../../../domain/entities/template.dart';
import 'comicsModel.dart';
import 'eventsModel.dart';
import 'heroesModel.dart';
import 'seriesListModel.dart';
import 'storiesModel.dart';

class ListResponseModel<T extends TemplateModel> {

  int? offset;
  int? limit;
  int? total;
  int? count;
  T? results;

  ListResponseModel({this.offset, this.limit, this.total, this.count, this.results});

  ListResponseModel.fromJson(dynamic json) {
    offset = json["offset"];
    limit = json["limit"];
    total = json["total"];
    count = json["count"];
    results = _getListData<T>(json["results"]);
  }

  static E _getListData<E extends TemplateModel>(List<dynamic> jsonData) {
    switch (E) {
      case ComicsModel:
        return ComicsModel.fromJson(jsonData) as E;
      case EventsModel:
        return EventsModel.fromJson(jsonData) as E;
      case HeroesModel:
        return HeroesModel.fromJson(jsonData) as E;
      case SeriesListModel:
        return SeriesListModel.fromJson(jsonData) as E;
      case StoriesModel:
        return StoriesModel.fromJson(jsonData) as E;
      default:
        throw UnsupportedError('Not Supported Type');
    }
  }

  ListResponse<C> toEntity<C extends Template>() => ListResponse<C>(
      offset: offset ?? 0,
      limit: limit ?? 0,
      total: total ?? 0,
      count: count ?? 0,
      results: _setListDataToEntity<C>()
  );

   L _setListDataToEntity<L extends Template>() {
    switch (L) {
      case Heroes:
        return (results as HeroesModel).toEntity() as L;
      case Comics:
        return (results as ComicsModel).toEntity() as L;
      case Events:
        return (results as EventsModel).toEntity() as L;
      case SeriesList:
        return (results as SeriesListModel).toEntity() as L;
      case Stories:
        return (results as StoriesModel).toEntity() as L;
      default:
        throw UnsupportedError('Not Supported Type');
    }
  }

}