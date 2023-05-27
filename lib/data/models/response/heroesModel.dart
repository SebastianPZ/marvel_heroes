
import 'package:marvel_heroes/domain/entities/heroes.dart';

import '../../../domain/entities/hero.dart';
import 'heroModel.dart';
import 'templateModel.dart';

class HeroesModel extends TemplateModel {

  List<HeroModel>? heroes;

  HeroesModel({this.heroes});

  HeroesModel.fromJson(dynamic data) {
    heroes = data.map((e) => HeroModel.fromJson(e)).toList().cast<HeroModel>();
  }

  Heroes toEntity() => Heroes(
    heroes: (heroes != null) ? heroes!.map((hero) => hero.toEntity()).toList().cast<Hero>() : []
  );

}