
import 'thumbnail.dart';

class Series {

  int id;
  String title;
  String description;
  String resourceURI;
  Thumbnail thumbnail;

  Series({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceURI,
    required this.thumbnail
  });

}