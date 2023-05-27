
import 'package:marvel_heroes/domain/entities/events.dart';
import 'package:marvel_heroes/domain/entities/event.dart';

import 'templateModel.dart';
import 'eventModel.dart';

class EventsModel extends TemplateModel {

  List<EventModel>? events;

  EventsModel({this.events});

  EventsModel.fromJson(dynamic data) {
    events = data.map((e) => EventModel.fromJson(e)).toList().cast<EventModel>();
  }

  Events toEntity() => Events(
      events: (events != null) ? events!.map((event) => event.toEntity()).toList().cast<Event>() : []
  );

}