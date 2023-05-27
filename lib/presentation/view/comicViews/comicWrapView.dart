
import 'package:flutter/cupertino.dart';
import 'package:marvel_heroes/presentation/view/comicViews/comicItemView.dart';
import 'package:marvel_heroes/presentation/view/utilViews/emptyWrapView.dart';
import 'package:marvel_heroes/presentation/view/utilViews/loadingWrapView.dart';
import 'package:marvel_heroes/presentation/viewModel/heroViewModels/heroDetailViewModel.dart';
import 'package:provider/provider.dart';

import '../../viewModel/comicViewModels/comicsViewModel.dart';

class ComicWrapView extends StatefulWidget {
  const ComicWrapView({super.key});

  @override
  State<ComicWrapView> createState() => _ComicWrapViewState();
}

class _ComicWrapViewState extends State<ComicWrapView> {

  @override
  void initState() {
    _getComicsAtFirstTime();
    super.initState();
  }

  void _getComicsAtFirstTime() {
    context.read<ComicsViewModel>().listComicsByHero(
        heroId: context.read<HeroDetailViewModel>().hero.id
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ComicsViewModel>(
      builder: (context, comics, _) {
        return
          comics.loading ?
            const LoadingWrapView() :
          comics.comics.isEmpty ?
            const EmptyWrapView() :
            Wrap(
              runSpacing: 20,
              spacing: 20,
              children: List.generate(comics.comics.length, (index) =>
                  ComicItemView(comic: comics.comics[index]))
            );
      }
    );
  }
}