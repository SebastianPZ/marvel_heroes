
import 'package:flutter/material.dart';
import 'package:marvel_heroes/presentation/view/seriesViews/seriesItemView.dart';
import 'package:marvel_heroes/presentation/view/utilViews/emptyWrapView.dart';
import 'package:marvel_heroes/presentation/view/utilViews/loadingWrapView.dart';
import 'package:marvel_heroes/presentation/viewModel/seriesViewModels/seriesListViewModel.dart';
import 'package:provider/provider.dart';

class SeriesWrapView extends StatefulWidget {
  const SeriesWrapView({super.key});

  @override
  State<SeriesWrapView> createState() => _SeriesWrapViewState();
}

class _SeriesWrapViewState extends State<SeriesWrapView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SeriesListViewModel>(
        builder: (context, series, _) {
          return
            series.loading ?
              const LoadingWrapView() :
            series.series.isEmpty ?
              const EmptyWrapView() :
              Wrap(
                runSpacing: 20,
                spacing: 20,
                children: List.generate(series.series.length, (index) =>
                    SeriesItemView(series: series.series[index]))
              );
        }
    );
  }
}