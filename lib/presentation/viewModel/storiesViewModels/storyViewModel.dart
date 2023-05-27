
import 'package:marvel_heroes/domain/entities/story.dart';

class StoryViewModel {

  Story story;

  StoryViewModel({required this.story});

  String get title => story.title;
  String get thumbnail => "${story.thumbnail.path}.${story.thumbnail.extension}";

}