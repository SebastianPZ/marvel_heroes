import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_heroes/presentation/view/splashView.dart';
import 'package:marvel_heroes/presentation/viewModel/comicViewModels/comicsViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/eventViewModels/eventsViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/heroViewModels/heroDetailViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/heroViewModels/heroesViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/seriesViewModels/seriesListViewModel.dart';
import 'package:marvel_heroes/presentation/viewModel/storiesViewModels/storiesViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HeroesViewModel()),
        ChangeNotifierProvider(create: (context) => HeroDetailViewModel()),
        ChangeNotifierProvider(create: (context) => ComicsViewModel()),
        ChangeNotifierProvider(create: (context) => EventsViewModel()),
        ChangeNotifierProvider(create: (context) => SeriesListViewModel()),
        ChangeNotifierProvider(create: (context) => StoriesViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const SplashView()
      ),
    );
  }
}
