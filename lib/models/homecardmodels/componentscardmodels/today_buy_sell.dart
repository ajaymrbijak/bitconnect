import 'dart:convert';

BuySellCardModel buySellCardModelFromMap(String str) =>
    BuySellCardModel.fromMap(json.decode(str));

String buySellCardModelToMap(BuySellCardModel data) =>
    json.encode(data.toMap());

class BuySellCardModel {
  BuySellCardModel({
    required this.button,
    required this.bgColor,
    required this.items,
    required this.eventFunnel,
    required this.eventsList,
  });

  final Button button;
  final String bgColor;
  final List<dynamic> items;
  final String eventFunnel;
  final List<EventsList> eventsList;

  factory BuySellCardModel.fromMap(Map<String, dynamic> json) =>
      BuySellCardModel(
        button: Button.fromMap(json["button"]),
        bgColor: json["bg_color"],
        items: List<dynamic>.from(json["items"].map((x) => x)),
        eventFunnel: json["event_funnel"],
        eventsList: List<EventsList>.from(
            json["events_list"].map((x) => EventsList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "button": button.toMap(),
        "bg_color": bgColor,
        "items": List<dynamic>.from(items.map((x) => x)),
        "event_funnel": eventFunnel,
        "events_list": List<dynamic>.from(eventsList.map((x) => x.toMap())),
      };
}

class Button {
  Button({
    required this.btnTextColor,
    required this.btnBgColorStart,
    required this.image,
    required this.btnBgColor,
    required this.btnBgColorEnd,
    required this.action,
    required this.btnText,
    required this.isGradient,
  });

  final String btnTextColor;
  final String btnBgColorStart;
  final String image;
  final String btnBgColor;
  final String btnBgColorEnd;
  final Action action;
  final String btnText;
  final bool isGradient;

  factory Button.fromMap(Map<String, dynamic> json) => Button(
        btnTextColor: json["btn_text_color"],
        btnBgColorStart: json["btn_bg_color_start"],
        image: json["image"],
        btnBgColor: json["btn_bg_color"],
        btnBgColorEnd: json["btn_bg_color_end"],
        action: Action.fromMap(json["action"]),
        btnText: json["btn_text"],
        isGradient: json["is_gradient"],
      );

  Map<String, dynamic> toMap() => {
        "btn_text_color": btnTextColor,
        "btn_bg_color_start": btnBgColorStart,
        "image": image,
        "btn_bg_color": btnBgColor,
        "btn_bg_color_end": btnBgColorEnd,
        "action": action.toMap(),
        "btn_text": btnText,
        "is_gradient": isGradient,
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
