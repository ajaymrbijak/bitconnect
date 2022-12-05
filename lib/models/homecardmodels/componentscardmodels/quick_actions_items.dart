import 'dart:convert';

List<QuickActionsItemsModel2> quickActionsItemsModel2FromMap(String str) =>
    List<QuickActionsItemsModel2>.from(
        json.decode(str).map((x) => QuickActionsItemsModel2.fromMap(x)));

String quickActionsItemsModel2ToMap(List<QuickActionsItemsModel2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class QuickActionsItemsModel2 {
  QuickActionsItemsModel2({
    required this.image,
    required this.imageHeight,
    required this.titleColor,
    required this.action,
    required this.id,
    required this.imageWidth,
    required this.title,
    required this.imageType,
  });

  final String image;
  final int imageHeight;
  final TitleColor titleColor;
  final Action action;
  final int id;
  final int imageWidth;
  final String title;
  final ImageType imageType;

  factory QuickActionsItemsModel2.fromMap(Map<String, dynamic> json) =>
      QuickActionsItemsModel2(
        image: json["image"],
        imageHeight: json["image_height"],
        titleColor: titleColorValues.map[json["title_color"]]!,
        action: Action.fromMap(json["action"]),
        id: json["id"],
        imageWidth: json["image_width"],
        title: json["title"],
        imageType: imageTypeValues.map[json["image_type"]]!,
      );

  Map<String, dynamic> toMap() => {
        "image": image,
        "image_height": imageHeight,
        "title_color": titleColorValues.reverse[titleColor],
        "action": action.toMap(),
        "id": id,
        "image_width": imageWidth,
        "title": title,
        "image_type": imageTypeValues.reverse[imageType],
      };
}

class Action {
  Action({
    required this.id,
    required this.route,
    required this.value,
    required this.eventFunnel,
    required this.eventsList,
  });

  final String id;
  final String route;
  final String value;
  final String eventFunnel;
  final List<EventsList> eventsList;

  factory Action.fromMap(Map<String, dynamic> json) => Action(
        id: json["id"],
        route: json["route"],
        value: json["value"],
        eventFunnel: json["event_funnel"],
        eventsList: List<EventsList>.from(
            json["events_list"].map((x) => EventsList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "route": route,
        "value": value,
        "event_funnel": eventFunnel,
        "events_list": List<dynamic>.from(eventsList.map((x) => x.toMap())),
      };
}

class EventsList {
  EventsList({
    required this.event,
    required this.eventValueMap,
  });

  final Event event;
  final EventValueMap eventValueMap;

  factory EventsList.fromMap(Map<String, dynamic> json) => EventsList(
        event: eventValues.map[json["event"]]!,
        eventValueMap: EventValueMap.fromMap(json["event_value_map"]),
      );

  Map<String, dynamic> toMap() => {
        "event": eventValues.reverse[event],
        "event_value_map": eventValueMap.toMap(),
      };
}

enum Event { MOB_QUICK_ACTION_CLICK }

final eventValues =
    EnumValues({"mob_quick_action_click": Event.MOB_QUICK_ACTION_CLICK});

class EventValueMap {
  EventValueMap({
    required this.landingPage,
    required this.sourcePage,
    required this.iconName,
    required this.iconPosition,
  });

  final String landingPage;
  final SourcePage sourcePage;
  final String iconName;
  final int iconPosition;

  factory EventValueMap.fromMap(Map<String, dynamic> json) => EventValueMap(
        landingPage: json["landing_page"],
        sourcePage: sourcePageValues.map[json["source_page"]]!,
        iconName: json["icon_name"],
        iconPosition: json["icon_position"],
      );

  Map<String, dynamic> toMap() => {
        "landing_page": landingPage,
        "source_page": sourcePageValues.reverse[sourcePage],
        "icon_name": iconName,
        "icon_position": iconPosition,
      };
}

enum SourcePage { HOME }

final sourcePageValues = EnumValues({"home": SourcePage.HOME});

enum ImageType { PNG }

final imageTypeValues = EnumValues({"PNG": ImageType.PNG});

enum TitleColor { THE_52575_C }

final titleColorValues = EnumValues({"#52575C": TitleColor.THE_52575_C});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
