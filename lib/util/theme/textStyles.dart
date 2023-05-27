
import 'package:flutter/material.dart';
import 'dart:ui' as size;

import 'package:marvel_heroes/util/theme/sizeStyle.dart';

TextStyle marvelMainHeroNameStyle({required size.Size size}) => TextStyle(
    color: Colors.white, fontSize: title2TextSize(size: size),
    fontWeight: FontWeight.bold);

TextStyle titleHeroStyle({required size.Size size}) => TextStyle(
    color: Colors.white, fontSize: title1TextSize(size: size),
    fontWeight: FontWeight.bold);

TextStyle descriptionHeroStyle({required size.Size size}) => TextStyle(
    color: Colors.white, fontSize: bodyTextSize(size: size),
    fontWeight: FontWeight.w400);

TextStyle optionSelectedStyle({required size.Size size}) => TextStyle(
    color: Colors.white, fontSize: bodyTextSize(size: size),
    fontWeight: FontWeight.w400);

TextStyle optionDeselectedStyle({required size.Size size}) => TextStyle(
    color: Colors.grey, fontSize: bodyTextSize(size: size),
    fontWeight: FontWeight.w400);

TextStyle emptyListStyle({required size.Size size}) => TextStyle(
    color: Colors.grey, fontSize: bodyTextSize(size: size),
    fontWeight: FontWeight.w500);

TextStyle pageTitleStyle({required size.Size size}) => TextStyle(
    color: Colors.black, fontSize: title3TextSize(size: size),
    fontWeight: FontWeight.w900);

