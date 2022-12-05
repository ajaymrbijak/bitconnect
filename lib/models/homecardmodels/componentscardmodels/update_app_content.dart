import 'dart:convert';

UpdateAppContentModel updateAppContentFromMap(String str) =>
    UpdateAppContentModel.fromMap(json.decode(str));

String updateAppContentToMap(UpdateAppContentModel data) =>
    json.encode(data.toMap());

class UpdateAppContentModel {
  UpdateAppContentModel({
    required this.title,
    required this.subTitle,
    required this.titleColor,
    required this.subTitleColor,
    required this.image,
    required this.imageType,
    required this.imageHeight,
    required this.imageWidth,
    required this.button,
  });

  final String title;
  final String subTitle;
  final String titleColor;
  final String subTitleColor;
  final String image;
  final String imageType;
  final int imageHeight;
  final int imageWidth;
  final Button button;

  factory UpdateAppContentModel.fromMap(Map<String, dynamic> json) =>
      UpdateAppContentModel(
        title: json["title"],
        subTitle: json["sub_title"],
        titleColor: json["title_color"],
        subTitleColor: json["sub_title_color"],
        image: json["image"],
        imageType: json["image_type"],
        imageHeight: json["image_height"],
        imageWidth: json["image_width"],
        button: Button.fromMap(json["button"]),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "sub_title": subTitle,
        "title_color": titleColor,
        "sub_title_color": subTitleColor,
        "image": image,
        "image_type": imageType,
        "image_height": imageHeight,
        "image_width": imageWidth,
        "button": button.toMap(),
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
    required this.btnImage,
    required this.btnImageType,
    required this.btnImageHeight,
    required this.btnImageWidth,
    required this.action,
  });

  final String btnText;
  final String btnTextColor;
  final String btnBgColor;
  final String btnBgColorStart;
  final String btnBgColorEnd;
  final bool isGradient;
  final String btnImage;
  final String btnImageType;
  final int btnImageHeight;
  final int btnImageWidth;
  final Action action;

  factory Button.fromMap(Map<String, dynamic> json) => Button(
        btnText: json["btn_text"],
        btnTextColor: json["btn_text_color"],
        btnBgColor: json["btn_bg_color"],
        btnBgColorStart: json["btn_bg_color_start"],
        btnBgColorEnd: json["btn_bg_color_end"],
        isGradient: json["is_gradient"],
        btnImage: json["btn_image"],
        btnImageType: json["btn_image_type"],
        btnImageHeight: json["btn_image_height"],
        btnImageWidth: json["btn_image_width"],
        action: Action.fromMap(json["action"]),
      );

  Map<String, dynamic> toMap() => {
        "btn_text": btnText,
        "btn_text_color": btnTextColor,
        "btn_bg_color": btnBgColor,
        "btn_bg_color_start": btnBgColorStart,
        "btn_bg_color_end": btnBgColorEnd,
        "is_gradient": isGradient,
        "btn_image": btnImage,
        "btn_image_type": btnImageType,
        "btn_image_height": btnImageHeight,
        "btn_image_width": btnImageWidth,
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
  final dynamic eventValueMap;
  final String eventFunnel;
  final List<dynamic> eventsList;
  final String value;
  final String route;

  factory Action.fromMap(Map<String, dynamic> json) => Action(
        id: json["id"],
        event: json["event"],
        eventValueMap: json["event_value_map"],
        eventFunnel: json["event_funnel"],
        eventsList: List<dynamic>.from(json["events_list"].map((x) => x)),
        value: json["value"],
        route: json["route"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "event": event,
        "event_value_map": eventValueMap,
        "event_funnel": eventFunnel,
        "events_list": List<dynamic>.from(eventsList.map((x) => x)),
        "value": value,
        "route": route,
      };
}
