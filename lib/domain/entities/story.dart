
import 'thumbnail.dart';

class Story {

  int id;
  String title;
  String description;
  String resourceURI;
  String type;
  Thumbnail thumbnail;

  Story({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceURI,
    required this.type,
    required this.thumbnail
  });

}