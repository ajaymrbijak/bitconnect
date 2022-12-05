import 'dart:convert';

TraderTipsModel traderTipsModelFromMap(String str) =>
    TraderTipsModel.fromMap(json.decode(str));

String traderTipsModelToMap(TraderTipsModel data) => json.encode(data.toMap());

class TraderTipsModel {
  TraderTipsModel({
    required this.items,
    required this.eventFunnel,
    required this.eventsList,
  });

  final List<Item> items;
  final String eventFunnel;
  final List<EventsList> eventsList;

  factory TraderTipsModel.fromMap(Map<String, dynamic> json) => TraderTipsModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        eventFunnel: json["event_funnel"],
        eventsList: List<EventsList>.from(
            json["events_list"].map((x) => EventsList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
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

class Item {
  Item({
    required this.subTitleColor,
    required this.bgColor,
    required this.image,
    required this.imageHeight,
    required this.subTitle,
    required this.titleColor,
    required this.imageWidth,
    required this.title,
  });

  final String subTitleColor;
  final String bgColor;
  final String image;
  final String imageHeight;
  final String subTitle;
  final String titleColor;
  final String imageWidth;
  final String title;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        subTitleColor: json["sub_title_color"],
        bgColor: json["bg_color"],
        image: json["image"],
        imageHeight: json["image_height"],
        subTitle: json["sub_title"],
        titleColor: json["title_color"],
        imageWidth: json["image_width"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "sub_title_color": subTitleColor,
        "bg_color": bgColor,
        "image": image,
        "image_height": imageHeight,
        "sub_title": subTitle,
        "title_color": titleColor,
        "image_width": imageWidth,
        "title": title,
      };
}
