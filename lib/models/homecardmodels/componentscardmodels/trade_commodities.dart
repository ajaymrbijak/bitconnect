import 'dart:convert';

TradersCommoditiesModel tradersCommoditiesModelFromMap(String str) =>
    TradersCommoditiesModel.fromMap(json.decode(str));

String tradersCommoditiesModelToMap(TradersCommoditiesModel data) =>
    json.encode(data.toMap());

class TradersCommoditiesModel {
  TradersCommoditiesModel({
    required this.items,
    required this.eventFunnel,
    required this.eventsList,
  });

  final List<dynamic> items;
  final String eventFunnel;
  final List<EventsList> eventsList;

  factory TradersCommoditiesModel.fromMap(Map<String, dynamic> json) =>
      TradersCommoditiesModel(
        items: List<dynamic>.from(json["items"].map((x) => x)),
        eventFunnel: json["event_funnel"],
        eventsList: List<EventsList>.from(
            json["events_list"].map((x) => EventsList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x)),
        "event_funnel": eventFunnel,
        "events_list": List<dynamic>.from(eventsList.map((x) => x.toMap())),
      };
}

class EventsList {
  EventsList({
    required this.event,
    required this.eventValueMap,
  });

  final String event;
  final EventValueMap eventValueMap;

  factory EventsList.fromMap(Map<String, dynamic> json) => EventsList(
        event: json["event"],
        eventValueMap: EventValueMap.fromMap(json["event_value_map"]),
      );

  Map<String, dynamic> toMap() => {
        "event": event,
        "event_value_map": eventValueMap.toMap(),
      };
}

class EventValueMap {
  EventValueMap({
    required this.landingPage,
    required this.sourcePage,
  });

  final String landingPage;
  final String sourcePage;

  factory EventValueMap.fromMap(Map<String, dynamic> json) => EventValueMap(
        landingPage: json["landing_page"],
        sourcePage: json["source_page"],
      );

  Map<String, dynamic> toMap() => {
        "landing_page": landingPage,
        "source_page": sourcePage,
      };
}
