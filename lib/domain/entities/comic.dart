
import 'thumbnail.dart';

class Comic {

  int id;
  int digitalId;
  String title;
  int issueNumber;
  String description;
  Thumbnail thumbnail;

  Comic({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.description,
    required this.thumbnail
  });

}