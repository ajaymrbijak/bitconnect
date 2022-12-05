import 'dart:convert';

CarouselBannersModel carouselBannersModelFromMap(String str) =>
    CarouselBannersModel.fromMap(json.decode(str));

String carouselBannersModelToMap(CarouselBannersModel data) =>
    json.encode(data.toMap());

class CarouselBannersModel {
  CarouselBannersModel({
    required this.items,
  });

  final List<Item> items;

  factory CarouselBannersModel.fromMap(Map<String, dynamic> json) =>
      CarouselBannersModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class Item {
  Item({
    required this.image,
    required this.link,
    required this.postValue,
    required this.postKey,
    required this.bgCard,
    required this.subTitleColor,
    required this.viewType,
    required this.type,
    required this.title,
    required this.subTitle,
    required this.name,
    required this.id,
    required this.titleColor,
    required this.action,
    required this.button,
  });

  final String image;
  final String link;
  final dynamic postValue;
  final dynamic postKey;
  final BgCard bgCard;
  final TitleColor subTitleColor;
  final int viewType;
  final int type;
  final String title;
  final String subTitle;
  final String name;
  final int id;
  final TitleColor titleColor;
  final ItemAction action;
  final Button button;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        image: json["image"],
        link: json["link"] == null ? null : json["link"]!,
        postValue: json["post_value"],
        postKey: json["post_key"],
        bgCard: bgCardValues.map[json["bg_card"]]!,
        subTitleColor: titleColorValues.map[json["sub_title_color"]]!,
        viewType: json["view_type"],
        type: json["type"],
        title: json["title"],
        subTitle: json["sub_title"] == null ? null : json["sub_title"],
        name: json["name"],
        id: json["id"],
        titleColor: titleColorValues.map[json["title_color"]]!,
        action: ItemAction.fromMap(json["action"]),
        button: Button.fromMap(json["button"]),
      );

  Map<String, dynamic> toMap() => {
        "image": image,
        "link": link == null ? null : link,
        "post_value": postValue,
        "post_key": postKey,
        "bg_card": bgCardValues.reverse[bgCard],
        "sub_title_color": titleColorValues.reverse[subTitleColor],
        "view_type": viewType,
        "type": type,
        "title": title,
        "sub_title": subTitle == null ? null : subTitle,
        "name": name,
        "id": id,
        "title_color": titleColorValues.reverse[titleColor],
        "action": action.toMap(),
        "button": button.toMap(),
      };
}

class ItemAction {
  ItemAction({
    required this.id,
    required this.event,
    required this.eventValueMap,
    required this.eventFunnel,
    required this.eventsList,
    required this.value,
    required this.route,
  });

  final String id;
  final ActionEvent event;
  final ActionEventValueMap eventValueMap;
  final EventFunnel eventFunnel;
  final List<EventsList> eventsList;
  final String value;
  final String route;

  factory ItemAction.fromMap(Map<String, dynamic> json) => ItemAction(
        id: json["id"],
        event: actionEventValues.map[json["event"]]!,
        eventValueMap: ActionEventValueMap.fromMap(json["event_value_map"]),
        eventFunnel: eventFunnelValues.map[json["event_funnel"]]!,
        eventsList: List<EventsList>.from(
            json["events_list"].map((x) => EventsList.fromMap(x))),
        value: json["value"],
        route: json["route"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "event": actionEventValues.reverse[event],
        "event_value_map": eventValueMap.toMap(),
        "event_funnel": eventFunnelValues.reverse[eventFunnel],
        "events_list": List<dynamic>.from(eventsList.map((x) => x.toMap())),
        "value": value,
        "route": route,
      };
}

enum ActionEvent { APP_BANNER_CLICK }

final actionEventValues =
    EnumValues({"app_banner_click": ActionEvent.APP_BANNER_CLICK});

enum EventFunnel { HOME }

final eventFunnelValues = EnumValues({"home": EventFunnel.HOME});

class ActionEventValueMap {
  ActionEventValueMap({
    required this.bannerTitle,
    required this.bannerPosition,
    required this.funnel,
  });

  final String bannerTitle;
  final String bannerPosition;
  final EventFunnel funnel;

  factory ActionEventValueMap.fromMap(Map<String, dynamic> json) =>
      ActionEventValueMap(
        bannerTitle: json["banner_title"],
        bannerPosition: json["banner_position"],
        funnel: eventFunnelValues.map[json["funnel"]]!,
      );

  Map<String, dynamic> toMap() => {
        "banner_title": bannerTitle,
        "banner_position": bannerPosition,
        "funnel": eventFunnelValues.reverse[funnel],
      };
}

class EventsList {
  EventsList({
    required this.event,
    required this.eventValueMap,
  });

  final EventsListEvent event;
  final EventsListEventValueMap eventValueMap;

  factory EventsList.fromMap(Map<String, dynamic> json) => EventsList(
        event: eventsListEventValues.map[json["event"]]!,
        eventValueMap: EventsListEventValueMap.fromMap(json["event_value_map"]),
      );

  Map<String, dynamic> toMap() => {
        "event": eventsListEventValues.reverse[event],
        "event_value_map": eventValueMap.toMap(),
      };
}

enum EventsListEvent { MOB_BANNER_CLICK }

final eventsListEventValues =
    EnumValues({"mob_banner_click": EventsListEvent.MOB_BANNER_CLICK});

class EventsListEventValueMap {
  EventsListEventValueMap({
    required this.sourcePage,
    required this.landingPage,
    required this.bannerName,
    required this.bannerPosition,
    required this.totalBanner,
    required this.commodityId,
  });

  final EventFunnel sourcePage;
  final String landingPage;
  final String bannerName;
  final int bannerPosition;
  final int totalBanner;
  final dynamic commodityId;

  factory EventsListEventValueMap.fromMap(Map<String, dynamic> json) =>
      EventsListEventValueMap(
        sourcePage: eventFunnelValues.map[json["source_page"]]!,
        landingPage: json["landing_page"],
        bannerName: json["banner_name"],
        bannerPosition: json["banner_position"],
        totalBanner: json["total_banner"],
        commodityId: json["commodity_id"],
      );

  Map<String, dynamic> toMap() => {
        "source_page": eventFunnelValues.reverse[sourcePage],
        "landing_page": landingPage,
        "banner_name": bannerName,
        "banner_position": bannerPosition,
        "total_banner": totalBanner,
        "commodity_id": commodityId,
      };
}

enum BgCard { FFFFF, D2_EBE0 }

final bgCardValues =
    EnumValues({"#d2ebe0": BgCard.D2_EBE0, "#fffff": BgCard.FFFFF});

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

  final BtnText btnText;
  final BtnTextColor btnTextColor;
  final BtnBgColor btnBgColor;
  final String btnBgColorStart;
  final String btnBgColorEnd;
  final bool isGradient;
  final ButtonAction action;

  factory Button.fromMap(Map<String, dynamic> json) => Button(
        btnText: btnTextValues.map[json["btn_text"]]!,
        btnTextColor: btnTextColorValues.map[json["btn_text_color"]]!,
        btnBgColor: btnBgColorValues.map[json["btn_bg_color"]]!,
        btnBgColorStart: json["btn_bg_color_start"],
        btnBgColorEnd: json["btn_bg_color_end"],
        isGradient: json["is_gradient"],
        action: ButtonAction.fromMap(json["action"]),
      );

  Map<String, dynamic> toMap() => {
        "btn_text": btnTextValues.reverse[btnText],
        "btn_text_color": btnTextColorValues.reverse[btnTextColor],
        "btn_bg_color": btnBgColorValues.reverse[btnBgColor],
        "btn_bg_color_start": btnBgColorStart,
        "btn_bg_color_end": btnBgColorEnd,
        "is_gradient": isGradient,
        "action": action.toMap(),
      };
}

class ButtonAction {
  ButtonAction();

  factory ButtonAction.fromMap(Map<String, dynamic> json) => ButtonAction();

  Map<String, dynamic> toMap() => {};
}

enum BtnBgColor { D0_D4_D7 }

final btnBgColorValues = EnumValues({"#D0D4D7": BtnBgColor.D0_D4_D7});

enum BtnText { GET_NOW }

final btnTextValues = EnumValues({"Get Now": BtnText.GET_NOW});

enum BtnTextColor { THE_32_AD79 }

final btnTextColorValues = EnumValues({"#32AD79": BtnTextColor.THE_32_AD79});

enum TitleColor { THE_525252 }

final titleColorValues = EnumValues({"#525252": TitleColor.THE_525252});

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
