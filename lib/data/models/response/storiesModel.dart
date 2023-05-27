
import 'package:marvel_heroes/domain/entities/stories.dart';
import 'package:marvel_heroes/domain/entities/story.dart';

import 'templateModel.dart';
import 'storyModel.dart';

class StoriesModel extends TemplateModel {

  List<StoryModel>? stories;

  StoriesModel({this.stories});

  StoriesModel.fromJson(dynamic data) {
    stories = data.map((e) => StoryModel.fromJson(e)).toList().cast<StoryModel>();
  }

  Stories toEntity() => Stories(
      stories: (stories != null) ? stories!.map((story) => story.toEntity()).toList().cast<Story>() : []
  );

}