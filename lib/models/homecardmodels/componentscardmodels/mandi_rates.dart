import 'dart:convert';

MandiRatesModel mandiRatesModelFromMap(String str) =>
    MandiRatesModel.fromMap(json.decode(str));

String mandiRatesModelToMap(MandiRatesModel data) => json.encode(data.toMap());

class MandiRatesModel {
  MandiRatesModel({
    required this.button,
    required this.items,
  });

  final Button button;
  final List<Item> items;

  factory MandiRatesModel.fromMap(Map<String, dynamic> json) => MandiRatesModel(
        button: Button.fromMap(json["button"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "button": button.toMap(),
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class Button {
  Button({
    required this.btnText,
    required this.btnTextColor,
    required this.btnBgColor,
    required this.btnBgColorStart,
    required this.btnBgColorEnd,
    required this.isGradient,
    required this.action,
  });

  final String btnText;
  final String btnTextColor;
  final String btnBgColor;
  final String btnBgColorStart;
  final String btnBgColorEnd;
  final bool isGradient;
  final Action action;

  factory Button.fromMap(Map<String, dynamic> json) => Button(
        btnText: json["btn_text"],
        btnTextColor: json["btn_text_color"],
        btnBgColor: json["btn_bg_color"],
        btnBgColorStart: json["btn_bg_color_start"],
        btnBgColorEnd: json["btn_bg_color_end"],
        isGradient: json["is_gradient"],
        action: Action.fromMap(json["action"]),
      );

  Map<String, dynamic> toMap() => {
        "btn_text": btnText,
        "btn_text_color": btnTextColor,
        "btn_bg_color": btnBgColor,
        "btn_bg_color_start": btnBgColorStart,
        "btn_bg_color_end": btnBgColorEnd,
        "is_gradient": isGradient,
        "action": action.toMap(),
      };
}

class Action {
  Action({
    required this.id,
    required this.event,
    required this.eventValueMap,
    required this.eventFunnel,
    required this.eventsList,
    required this.value,
    required this.route,
  });

  final String id;
  final String event;
  final EventValueMap eventValueMap;
  final String eventFunnel;
  final List<EventsList> eventsList;
  final String value;
  final String route;

  factory Action.fromMap(Map<String, dynamic> json) => Action(
        id: json["id"],
        event: json["event"],
        eventValueMap: EventValueMap.fromMap(json["event_value_map"]),
        eventFunnel: json["event_funnel"],
        eventsList: List<EventsList>.from(
            json["events_list"].map((x) => EventsList.fromMap(x))),
        value: json["value"],
        route: json["route"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "event": event,
        "event_value_map": eventValueMap.toMap(),
        "event_funnel": eventFunnel,
        "events_list": List<dynamic>.from(eventsList.map((x) => x.toMap())),
        "value": value,
        "route": route,
      };
}

class EventValueMap {
  EventValueMap({
    this.commodity,
    this.clickPosition,
    required this.sourcePage,
    required this.landingPage,
    this.isShortClick,
    this.funnel,
    this.commodityId,
    this.isShortcut,
  });

  final String? commodity;
  final String? clickPosition;
  final SourcePage sourcePage;
  final LandingPage landingPage;
  final bool? isShortClick;
  final String? funnel;
  final int? commodityId;
  final bool? isShortcut;

  factory EventValueMap.fromMap(Map<String, dynamic> json) => EventValueMap(
        commodity: json["commodity"],
        clickPosition: json["click_position"],
        sourcePage: sourcePageValues.map[json["source_page"]]!,
        landingPage: landingPageValues.map[json["landing_page"]]!,
        isShortClick:
            json["is_short_click"] == null ? null : json["is_short_click"],
        funnel: json["funnel"] == null ? null : json["funnel"],
        commodityId: json["commodity_id"] ?? null,
        isShortcut: json["is_shortcut"] == null ? null : json["is_shortcut"],
      );

  Map<String, dynamic> toMap() => {
        "commodity": commodity,
        "click_position": clickPosition == null ? null : clickPosition,
        "source_page": sourcePageValues.reverse[sourcePage],
        "landing_page": landingPageValues.reverse[landingPage],
        "is_short_click": isShortClick == null ? null : isShortClick,
        "funnel": funnel == null ? null : funnel,
        "commodity_id": commodityId == null ? null : commodityId,
        "is_shortcut": isShortcut == null ? null : isShortcut,
      };
}

enum LandingPage {
  MANDI_RATE_COMMODITY_LIST_SCREEN,
  APP_MANDI_RATE_MANDI_SCREEN
}

final landingPageValues = EnumValues({
  "app_mandi_rate_mandi_screen": LandingPage.APP_MANDI_RATE_MANDI_SCREEN,
  "mandi_rate_commodity_list_screen":
      LandingPage.MANDI_RATE_COMMODITY_LIST_SCREEN
});

enum SourcePage { HOME }

final sourcePageValues = EnumValues({"home": SourcePage.HOME});

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

class Item {
  Item({
    required this.title,
    required this.titleColor,
    required this.imageHeight,
    required this.imageWidth,
    required this.image,
    required this.imageType,
    required this.action,
  });

  final String title;
  final String titleColor;
  final int imageHeight;
  final int imageWidth;
  final String image;
  final String imageType;
  final Action action;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        title: json["title"],
        titleColor: json["title_color"],
        imageHeight: json["image_height"],
        imageWidth: json["image_width"],
        image: json["image"],
        imageType: json["image_type"],
        action: Action.fromMap(json["action"]),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "title_color": titleColor,
        "image_height": imageHeight,
        "image_width": imageWidth,
        "image": image,
        "image_type": imageType,
        "action": action.toMap(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}

// import 'dart:convert';

// MandiRates mandiRatesFromJson(String str) =>
//     MandiRates.fromJson(json.decode(str));

// String mandiRatesToJson(MandiRates data) => json.encode(data.toJson());

// class MandiRates {
//   MandiRates({
//     required this.cardType,
//     required this.id,
//     required this.title,
//     required this.viewType,
//     required this.subTitle,
//     required this.bgColor,
//     required this.bgImage,
//     required this.titleColor,
//     required this.subTitleColor,
//     required this.widgetType,
//     required this.aspectRatio,
//     required this.content,
//     required this.borderColor,
//     required this.items,
//     required this.cardPosition,
//   });

//   final int cardType;
//   final String id;
//   final String title;
//   final String viewType;
//   final String subTitle;
//   final String bgColor;
//   final String bgImage;
//   final String titleColor;
//   final String subTitleColor;
//   final String widgetType;
//   final int aspectRatio;
//   final Content content;
//   final String borderColor;
//   final dynamic items;
//   final int cardPosition;

//   factory MandiRates.fromJson(Map<String, dynamic> json) => MandiRates(
//         cardType: json["card_type"],
//         id: json["id"],
//         title: json["title"],
//         viewType: json["view_type"],
//         subTitle: json["sub_title"],
//         bgColor: json["bg_color"],
//         bgImage: json["bg_image"],
//         titleColor: json["title_color"],
//         subTitleColor: json["sub_title_color"],
//         widgetType: json["widget_type"],
//         aspectRatio: json["aspect_ratio"],
//         content: Content.fromJson(json["content"]),
//         borderColor: json["border_color"],
//         items: json["items"],
//         cardPosition: json["card_position"],
//       );

//   Map<String, dynamic> toJson() => {
//         "card_type": cardType,
//         "id": id,
//         "title": title,
//         "view_type": viewType,
//         "sub_title": subTitle,
//         "bg_color": bgColor,
//         "bg_image": bgImage,
//         "title_color": titleColor,
//         "sub_title_color": subTitleColor,
//         "widget_type": widgetType,
//         "aspect_ratio": aspectRatio,
//         "content": content.toJson(),
//         "border_color": borderColor,
//         "items": items,
//         "card_position": cardPosition,
//       };
// }

// class Content {
//   Content({
//     required this.button,
//     required this.items,
//   });

//   final Button button;
//   final List<Item> items;

//   factory Content.fromJson(Map<String, dynamic> json) => Content(
//         button: Button.fromJson(json["button"]),
//         items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "button": button.toJson(),
//         "items": List<dynamic>.from(items.map((x) => x.toJson())),
//       };
// }

// class Button {
//   Button({
//     required this.btnText,
//     required this.btnTextColor,
//     required this.btnBgColor,
//     required this.btnBgColorStart,
//     required this.btnBgColorEnd,
//     required this.isGradient,
//     required this.action,
//   });

//   final String btnText;
//   final String btnTextColor;
//   final String btnBgColor;
//   final String btnBgColorStart;
//   final String btnBgColorEnd;
//   final bool isGradient;
//   final Action action;

//   factory Button.fromJson(Map<String, dynamic> json) => Button(
//         btnText: json["btn_text"],
//         btnTextColor: json["btn_text_color"],
//         btnBgColor: json["btn_bg_color"],
//         btnBgColorStart: json["btn_bg_color_start"],
//         btnBgColorEnd: json["btn_bg_color_end"],
//         isGradient: json["is_gradient"],
//         action: Action.fromJson(json["action"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "btn_text": btnText,
//         "btn_text_color": btnTextColor,
//         "btn_bg_color": btnBgColor,
//         "btn_bg_color_start": btnBgColorStart,
//         "btn_bg_color_end": btnBgColorEnd,
//         "is_gradient": isGradient,
//         "action": action.toJson(),
//       };
// }

// class Action {
//   Action({
//     required this.id,
//     required this.event,
//     required this.eventValueMap,
//     required this.eventFunnel,
//     required this.eventsList,
//     required this.value,
//     required this.route,
//   });

//   final String id;
//   final String event;
//   final EventValueMap eventValueMap;
//   final String eventFunnel;
//   final List<EventsList> eventsList;
//   final String value;
//   final String route;

//   factory Action.fromJson(Map<String, dynamic> json) => Action(
//         id: json["id"],
//         event: json["event"],
//         eventValueMap: EventValueMap.fromJson(json["event_value_map"]),
//         eventFunnel: json["event_funnel"],
//         eventsList: List<EventsList>.from(
//             json["events_list"].map((x) => EventsList.fromJson(x))),
//         value: json["value"],
//         route: json["route"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "event": event,
//         "event_value_map": eventValueMap.toJson(),
//         "event_funnel": eventFunnel,
//         "events_list": List<dynamic>.from(eventsList.map((x) => x.toJson())),
//         "value": value,
//         "route": route,
//       };
// }

// class EventValueMap {
//   EventValueMap({
//     required this.commodity,
//     required this.clickPosition,
//     required this.sourcePage,
//     required this.landingPage,
//     required this.isShortClick,
//     required this.funnel,
//     required this.commodityId,
//     required this.isShortcut,
//   });

//   final String commodity;
//   final String clickPosition;
//   final SourcePage sourcePage;
//   final LandingPage landingPage;
//   final bool isShortClick;
//   final String funnel;
//   final int commodityId;
//   final bool isShortcut;

//   factory EventValueMap.fromJson(Map<String, dynamic> json) => EventValueMap(
//         commodity: json["commodity"],
//         clickPosition: json["click_position"] ?? null,
//         sourcePage: sourcePageValues.map[json["source_page"]]!,
//         landingPage: landingPageValues.map[json["landing_page"]]!,
//         isShortClick:
//             json["is_short_click"] == null ? null : json["is_short_click"],
//         funnel: json["funnel"] == null ? null : json["funnel"],
//         commodityId: json["commodity_id"] == null ? null : json["commodity_id"],
//         isShortcut: json["is_shortcut"] == null ? null : json["is_shortcut"],
//       );

//   Map<String, dynamic> toJson() => {
//         "commodity": commodity,
//         "click_position": clickPosition == null ? null : clickPosition,
//         "source_page": sourcePageValues.reverse[sourcePage],
//         "landing_page": landingPageValues.reverse[landingPage],
//         "is_short_click": isShortClick == null ? null : isShortClick,
//         "funnel": funnel == null ? null : funnel,
//         "commodity_id": commodityId == null ? null : commodityId,
//         "is_shortcut": isShortcut == null ? null : isShortcut,
//       };
// }

// enum LandingPage {
//   MANDI_RATE_COMMODITY_LIST_SCREEN,
//   APP_MANDI_RATE_MANDI_SCREEN
// }

// final landingPageValues = EnumValues({
//   "app_mandi_rate_mandi_screen": LandingPage.APP_MANDI_RATE_MANDI_SCREEN,
//   "mandi_rate_commodity_list_screen":
//       LandingPage.MANDI_RATE_COMMODITY_LIST_SCREEN
// });

// enum SourcePage { HOME }

// final sourcePageValues = EnumValues({"home": SourcePage.HOME});

// class EventsList {
//   EventsList({
//     required this.event,
//     required this.eventValueMap,
//   });

//   final String event;
//   final EventValueMap eventValueMap;

//   factory EventsList.fromJson(Map<String, dynamic> json) => EventsList(
//         event: json["event"],
//         eventValueMap: EventValueMap.fromJson(json["event_value_map"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "event": event,
//         "event_value_map": eventValueMap.toJson(),
//       };
// }

// class Item {
//   Item({
//     required this.title,
//     required this.titleColor,
//     required this.imageHeight,
//     required this.imageWidth,
//     required this.image,
//     required this.imageType,
//     required this.action,
//   });

//   final String title;
//   final String titleColor;
//   final int imageHeight;
//   final int imageWidth;
//   final String image;
//   final String imageType;
//   final Action action;

//   factory Item.fromJson(Map<String, dynamic> json) => Item(
//         title: json["title"],
//         titleColor: json["title_color"],
//         imageHeight: json["image_height"],
//         imageWidth: json["image_width"],
//         image: json["image"],
//         imageType: json["image_type"],
//         action: Action.fromJson(json["action"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "title_color": titleColor,
//         "image_height": imageHeight,
//         "image_width": imageWidth,
//         "image": image,
//         "image_type": imageType,
//         "action": action.toJson(),
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String>? reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap ??= map.map((k, v) => MapEntry(v, k));
//     return reverseMap!;
//   }
// }
