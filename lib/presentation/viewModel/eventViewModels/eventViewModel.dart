
import 'package:marvel_heroes/domain/entities/event.dart';

class EventViewModel {

  Event event;

  EventViewModel({required this.event});

  String get title => event.title;
  String get thumbnail => "${event.thumbnail.path}.${event.thumbnail.extension}";

}