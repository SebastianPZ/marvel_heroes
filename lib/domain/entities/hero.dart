
import 'thumbnail.dart';

class Hero {

  int id;
  String name;
  String description;
  String modified;
  Thumbnail thumbnail;
  String resourceURI;
  Map<String, dynamic> comics;
  Map<String, dynamic> series;
  Map<String, dynamic> stories;
  Map<String, dynamic> events;
  List<Map<String, dynamic>> urls;

  Hero({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceURI,
    required this.comics,
    required this.series, required
    this.stories,
    required this.events, required
    this.urls
  });

}