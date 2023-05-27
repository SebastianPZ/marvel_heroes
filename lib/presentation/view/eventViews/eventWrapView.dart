
import 'package:flutter/material.dart';
import 'package:marvel_heroes/presentation/view/utilViews/emptyWrapView.dart';
import 'package:marvel_heroes/presentation/view/eventViews/eventItemView.dart';
import 'package:marvel_heroes/presentation/view/utilViews/loadingWrapView.dart';
import 'package:marvel_heroes/presentation/viewModel/eventViewModels/eventsViewModel.dart';
import 'package:provider/provider.dart';

class EventWrapView extends StatefulWidget {
  const EventWrapView({super.key});

  @override
  State<EventWrapView> createState() => _EventWrapViewState();
}

class _EventWrapViewState extends State<EventWrapView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EventsViewModel>(
        builder: (context, events, _) {
          return 
            events.loading ?
              const LoadingWrapView() :
            events.events.isEmpty ?
              const EmptyWrapView() :
              Wrap(
                runSpacing: 20,
                spacing: 20,
                children: List.generate(events.events.length, (index) =>
                    EventItemView(event: events.events[index]))
            );
        }
    );
  }
}