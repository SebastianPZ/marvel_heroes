
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_heroes/presentation/view/homeView.dart';
import 'package:marvel_heroes/presentation/viewModel/heroViewModels/heroesViewModel.dart';
import 'package:marvel_heroes/util/theme/drawable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../util/theme/colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}


class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    _getHeroesList();
    super.initState();
  }

  Future<void> _getHeroesList() async {
    context.read<HeroesViewModel>().listHeroes().whenComplete(() {
      Navigator.pushReplacement(
          context,
          PageTransition(
              duration: const Duration(milliseconds: 200),
              reverseDuration: const Duration(milliseconds: 200),
              type: PageTransitionType.rightToLeft,
              child: const HomeView(title: "Marvel")
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: size.height * 0.08,
            child: const FadeInImage(
                placeholder: AssetImage(marvelWhiteLogo),
                image: AssetImage(marvelWhiteLogo)
            ),
          ),
        ),
      ),
    );
  }
}