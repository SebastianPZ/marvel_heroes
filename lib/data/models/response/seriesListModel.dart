
import 'package:marvel_heroes/domain/entities/seriesList.dart';
import 'package:marvel_heroes/domain/entities/series.dart';

import 'templateModel.dart';
import 'seriesModel.dart';

class SeriesListModel extends TemplateModel {

  List<SeriesModel>? seriesList;

  SeriesListModel({this.seriesList});

  SeriesListModel.fromJson(dynamic data) {
    seriesList = data.map((e) => SeriesModel.fromJson(e)).toList().cast<SeriesModel>();
  }

  SeriesList toEntity() => SeriesList(
      series: (seriesList != null) ? seriesList!.map((series) => series.toEntity()).toList().cast<Series>() : []
  );

}