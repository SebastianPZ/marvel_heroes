
import 'thumbnail.dart';

class Event {

  int id;
  String title;
  String description;
  String resourceURI;
  Thumbnail thumbnail;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceURI,
    required this.thumbnail
  });

}