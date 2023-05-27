
import 'package:flutter/material.dart';
import 'package:marvel_heroes/presentation/view/heroViews/heroCarouselView.dart';
import 'package:marvel_heroes/util/strings.dart';
import 'package:marvel_heroes/util/theme/colors.dart';
import 'package:marvel_heroes/util/theme/textStyles.dart';
import 'package:provider/provider.dart';

import '../../util/theme/drawable.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: Center(
            child: Image.asset(
              marvelBlackLogo,
              height: size.height * 0.04,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.05),
                child: Text(heroesTitle, style: pageTitleStyle(size: size),),
              ),
              const HeroCarouselView()
            ],
          ),
        ),
      ),
    );
  }
}