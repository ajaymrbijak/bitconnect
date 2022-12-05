import 'package:meta/meta.dart';
import 'dart:convert';

ReferalCardModel ReferalCardModelFromMap(String str) =>
    ReferalCardModel.fromMap(json.decode(str));

String ReferalCardModelToMap(ReferalCardModel data) =>
    json.encode(data.toMap());

class ReferalCardModel {
  ReferalCardModel({
    required this.subTitleColor,
    required this.image,
    required this.buttons,
    required this.subTitle,
    required this.color,
    required this.titleColor,
    required this.imageWidth,
    required this.title,
    required this.cardBottomColor,
    required this.imageHeight,
    required this.size,
    required this.cardTopColor,
    required this.action,
    required this.imageType,
  });

  final String subTitleColor;
  final String image;
  final List<Button> buttons;
  final String subTitle;
  final String color;
  final String titleColor;
  final int imageWidth;
  final String title;
  final String cardBottomColor;
  final int imageHeight;
  final String size;
  final String cardTopColor;
  final Action action;
  final String imageType;

  factory ReferalCardModel.fromMap(Map<String, dynamic> json) =>
      ReferalCardModel(
        subTitleColor: json["sub_title_color"],
        image: json["image"],
        buttons:
            List<Button>.from(json["buttons"].map((x) => Button.fromMap(x))),
        subTitle: json["sub_title"],
        color: json["color"],
        titleColor: json["title_color"],
        imageWidth: json["image_width"],
        title: json["title"],
        cardBottomColor: json["card_bottom_color"],
        imageHeight: json["image_height"],
        size: json["size"],
        cardTopColor: json["card_top_color"],
        action: Action.fromMap(json["action"]),
        imageType: json["image_type"],
      );

  Map<String, dynamic> toMap() => {
        "sub_title_color": subTitleColor,
        "image": image,
        "buttons": List<dynamic>.from(buttons.map((x) => x.toMap())),
        "sub_title": subTitle,
        "color": color,
        "title_color": titleColor,
        "image_width": imageWidth,
        "title": title,
        "card_bottom_color": cardBottomColor,
        "image_height": imageHeight,
        "size": size,
        "card_top_color": cardTopColor,
        "action": action.toMap(),
        "image_type": imageType,
      };
}

class Action {
  Action({
    required this.id,
    required this.route,
    required this.value,
    required this.eventsList,
  });

  final String id;
  final String route;
  final String value;
  final List<EventsList> eventsList;

  factory Action.fromMap(Map<String, dynamic> json) => Action(
        id: json["id"],
        route: json["route"],
        value: json["value"],
        eventsList: List<EventsList>.from(
            json["events_list"].map((x) => EventsList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "route": route,
        "value": value,
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
    required this.bannerName,
    required this.bannerPosition,
    required this.totalBanner,
  });

  final String landingPage;
  final String sourcePage;
  final String bannerName;
  final int bannerPosition;
  final int totalBanner;

  factory EventValueMap.fromMap(Map<String, dynamic> json) => EventValueMap(
        landingPage: json["landing_page"],
        sourcePage: json["source_page"],
        bannerName: json["banner_name"],
        bannerPosition: json["banner_position"],
        totalBanner: json["total_banner"],
      );

  Map<String, dynamic> toMap() => {
        "landing_page": landingPage,
        "source_page": sourcePage,
        "banner_name": bannerName,
        "banner_position": bannerPosition,
        "total_banner": totalBanner,
      };
}

class Button {
  Button({
    required this.btnTextColor,
    required this.btnBgColorStart,
    required this.btnBgColor,
    required this.btnBgColorEnd,
    required this.action,
    required this.btnStrokeColor,
    required this.btnText,
    required this.isGradient,
    this.btnStrokeWidth,
  });

  final String btnTextColor;
  final String btnBgColorStart;
  final String btnBgColor;
  final String btnBgColorEnd;
  final Action action;
  final String btnStrokeColor;
  final String btnText;
  final bool isGradient;
  final int? btnStrokeWidth;

  factory Button.fromMap(Map<String, dynamic> json) => Button(
        btnTextColor: json["btn_text_color"],
        btnBgColorStart: json["btn_bg_color_start"],
        btnBgColor: json["btn_bg_color"],
        btnBgColorEnd: json["btn_bg_color_end"],
        action: Action.fromMap(json["action"]),
        btnStrokeColor: json["btn_stroke_color"],
        btnText: json["btn_text"],
        isGradient: json["is_gradient"],
        btnStrokeWidth:
            json["btn_stroke_width"] == null ? null : json["btn_stroke_width"],
      );

  Map<String, dynamic> toMap() => {
        "btn_text_color": btnTextColor,
        "btn_bg_color_start": btnBgColorStart,
        "btn_bg_color": btnBgColor,
        "btn_bg_color_end": btnBgColorEnd,
        "action": action.toMap(),
        "btn_stroke_color": btnStrokeColor,
        "btn_text": btnText,
        "is_gradient": isGradient,
        "btn_stroke_width": btnStrokeWidth == null ? null : btnStrokeWidth,
      };
}
