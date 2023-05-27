
import 'package:marvel_heroes/domain/entities/hero.dart';

class HeroViewModel {

  Hero hero;

  HeroViewModel({required this.hero});

  int get id => hero.id;
  String get name => hero.name;
  String get thumbnail => "${hero.thumbnail.path}.${hero.thumbnail.extension}";
  String get description => hero.description;

}