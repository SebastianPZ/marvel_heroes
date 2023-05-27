
import 'package:flutter/material.dart';
import 'package:marvel_heroes/presentation/view/comicViews/comicWrapView.dart';
import 'package:marvel_heroes/presentation/view/eventViews/eventWrapView.dart';
import 'package:marvel_heroes/presentation/view/heroViews/heroBannerView.dart';
import 'package:marvel_heroes/presentation/view/heroViews/heroOptionsView.dart';
import 'package:marvel_heroes/presentation/view/seriesViews/seriesWrapView.dart';
import 'package:marvel_heroes/presentation/view/storyViews/storyWrapView.dart';
import 'package:marvel_heroes/presentation/viewModel/comicViewModels/comicsViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/eventViewModels/eventsViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/heroViewModels/heroDetailViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/seriesViewModels/seriesListViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/storiesViewModels/storiesViewModel.dart';
import 'package:provider/provider.dart';

class HeroDetailView extends StatefulWidget {
  const HeroDetailView({super.key});
  
  @override
  State<StatefulWidget> createState() => _HeroDetailViewState();
  
}

class _HeroDetailViewState extends State<HeroDetailView> {

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () => _cleanDetailValues(),
      child: SafeArea(
        child: Scaffold(
          body: Consumer<HeroDetailViewModel>(
            builder: (context, heroDetail, _) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        HeroBannerView(
                            hero: heroDetail.hero,
                            backAction: _cleanDetailValues(),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: size.height * 0.38),
                            child: const HeroOptionsView())
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.02,
                        left: size.width * 0.05,
                        right: size.width * 0.05,
                        bottom: size.height * 0.05,
                      ),
                      child: IndexedStack(
                        index: heroDetail.option.index,
                        children: const [
                          ComicWrapView(),
                          EventWrapView(),
                          SeriesWrapView(),
                          StoryWrapView()
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }

  Future<bool> _cleanDetailValues() async {
    context.read<ComicsViewModel>().clean();
    context.read<EventsViewModel>().clean();
    context.read<SeriesListViewModel>().clean();
    context.read<StoriesViewModel>().clean();
    return true;
  }

}