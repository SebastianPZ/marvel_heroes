
import 'package:marvel_heroes/domain/entities/comics.dart';
import 'package:marvel_heroes/domain/entities/comic.dart';

import 'comicModel.dart';
import 'templateModel.dart';

class ComicsModel extends TemplateModel {

  List<ComicModel>? comics;

  ComicsModel({this.comics});

  ComicsModel.fromJson(dynamic data) {
    comics = data.map((e) => ComicModel.fromJson(e)).toList().cast<ComicModel>();
  }

  Comics toEntity() => Comics(
      comics: (comics != null) ? comics!.map((comic) => comic.toEntity()).toList().cast<Comic>() : []
  );
}