
import 'package:flutter/cupertino.dart';
import 'package:marvel_heroes/presentation/view/storyViews/storyItemView.dart';
import 'package:marvel_heroes/presentation/view/utilViews/emptyWrapView.dart';
import 'package:marvel_heroes/presentation/view/utilViews/loadingWrapView.dart';
import 'package:marvel_heroes/presentation/viewModel/storiesViewModels/storiesViewModel.dart';
import 'package:provider/provider.dart';

class StoryWrapView extends StatefulWidget {
  const StoryWrapView({super.key});

  @override
  State<StoryWrapView> createState() => _StoryWrapViewState();
}

class _StoryWrapViewState extends State<StoryWrapView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StoriesViewModel>(
        builder: (context, stories, _) {
          return
            stories.loading ?
              const LoadingWrapView() :
            stories.stories.isEmpty ?
              const EmptyWrapView() :
              Wrap(
                runSpacing: 20,
                spacing: 20,
                children: List.generate(stories.stories.length, (index) =>
                    StoryItemView(story: stories.stories[index]))
              );
        }
    );
  }
}