
import 'package:flutter/material.dart';
import 'package:marvel_heroes/presentation/view/utilViews/loadingItemView.dart';

class LoadingWrapView extends StatelessWidget {
  const LoadingWrapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 20,
        spacing: 20,
        children: List.generate(6, (index) => const LoadingItemView())
    );
  }
}