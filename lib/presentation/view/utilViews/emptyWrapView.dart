
import 'package:flutter/material.dart';
import 'package:marvel_heroes/presentation/viewModel/heroViewModels/heroDetailViewModel.dart';
import 'package:marvel_heroes/util/theme/textStyles.dart';
import 'package:provider/provider.dart';

class EmptyWrapView extends StatefulWidget {
  const EmptyWrapView({super.key});

  @override
  State<EmptyWrapView> createState() => _EmptyWrapViewState();
}

class _EmptyWrapViewState extends State<EmptyWrapView> {

  late Option option;

  @override
  void initState() {
    option = context.read<HeroDetailViewModel>().option;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        height: size.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.layers_clear,
              color: Colors.grey,
              size: size.height * 0.06
            ),
            const SizedBox(height: 5,),
            Text(
              "No ${option.name} related to this hero",
              style: emptyListStyle(size: size),
            )
          ],
        ),
      ),
    );
  }
}