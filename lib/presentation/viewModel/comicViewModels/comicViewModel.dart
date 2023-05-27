
import 'package:marvel_heroes/domain/entities/comic.dart';

class ComicViewModel {

  Comic comic;

  ComicViewModel({required this.comic});

  String get title => comic.title;
  String get thumbnail => "${comic.thumbnail.path}.${comic.thumbnail.extension}";

}