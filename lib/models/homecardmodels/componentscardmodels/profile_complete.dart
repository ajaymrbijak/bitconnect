import 'dart:convert';

ProfileCompletionModel profileCompletionModelFromMap(String str) =>
    ProfileCompletionModel.fromMap(json.decode(str));

String profileCompletionModelToMap(ProfileCompletionModel data) =>
    json.encode(data.toMap());

class ProfileCompletionModel {
  ProfileCompletionModel({
    required this.profileCompletePercent,
    required this.profileCompletePercentColor,
    required this.item,
    required this.congratulationCard,
    required this.profileCompletePercentLineColor,
  });

  final int profileCompletePercent;
  final String profileCompletePercentColor;
  final List<Item> item;
  final CongratulationCard congratulationCard;
  final String profileCompletePercentLineColor;

  factory ProfileCompletionModel.fromMap(Map<String, dynamic> json) =>
      ProfileCompletionModel(
        profileCompletePercent: json["profile_complete_percent"],
        profileCompletePercentColor: json["profile_complete_percent_color"],
        item: List<Item>.from(json["item"].map((x) => Item.fromMap(x))),
        congratulationCard:
            CongratulationCard.fromMap(json["congratulation_card"]),
        profileCompletePercentLineColor:
            json["profile_complete_percent_line_color"],
      );

  Map<String, dynamic> toMap() => {
        "profile_complete_percent": profileCompletePercent,
        "profile_complete_percent_color": profileCompletePercentColor,
        "item": List<dynamic>.from(item.map((x) => x.toMap())),
        "congratulation_card": congratulationCard.toMap(),
        "profile_complete_percent_line_color": profileCompletePercentLineColor,
      };
}

class CongratulationCard {
  CongratulationCard({
    required this.crossImage,
    required this.image,
    required this.titleColor,
    required this.cardTitleColor,
    required this.description,
    required this.cardDescriptionColor,
    required this.imageWidth,
    required this.title,
    required this.bgImage,
    required this.cardDescription,
    required this.descriptionColor,
    required this.bgColor,
    required this.crossImageHeight,
    required this.cardTitle,
    required this.imageHeight,
    required this.eventFunnel,
    required this.eventsList,
    required this.crossImageWidth,
  });

  final String crossImage;
  final String image;
  final String titleColor;
  final String cardTitleColor;
  final String description;
  final String cardDescriptionColor;
  final int imageWidth;
  final String title;
  final String bgImage;
  final String cardDescription;
  final String descriptionColor;
  final String bgColor;
  final int crossImageHeight;
  final String cardTitle;
  final int imageHeight;
  final String eventFunnel;
  final List<EventsList> eventsList;
  final int crossImageWidth;

  factory CongratulationCard.fromMap(Map<String, dynamic> json) =>
      CongratulationCard(
        crossImage: json["cross_image"],
        image: json["image"],
        titleColor: json["title_color"],
        cardTitleColor: json["card_title_color"],
        description: json["description"],
        cardDescriptionColor: json["card_description_color"],
        imageWidth: json["image_width"],
        title: json["title"],
        bgImage: json["bg_image"],
        cardDescription: json["card_description"],
        descriptionColor: json["description_color"],
        bgColor: json["bg_color"],
        crossImageHeight: json["cross_image_height"],
        cardTitle: json["card_title"],
        imageHeight: json["image_height"],
        eventFunnel: json["event_funnel"],
        eventsList: List<EventsList>.from(
            json["events_list"].map((x) => EventsList.fromMap(x))),
        crossImageWidth: json["cross_image_width"],
      );

  Map<String, dynamic> toMap() => {
        "cross_image": crossImage,
        "image": image,
        "title_color": titleColor,
        "card_title_color": cardTitleColor,
        "description": description,
        "card_description_color": cardDescriptionColor,
        "image_width": imageWidth,
        "title": title,
        "bg_image": bgImage,
        "card_description": cardDescription,
        "description_color": descriptionColor,
        "bg_color": bgColor,
        "cross_image_height": crossImageHeight,
        "card_title": cardTitle,
        "image_height": imageHeight,
        "event_funnel": eventFunnel,
        "events_list": List<dynamic>.from(eventsList.map((x) => x.toMap())),
        "cross_image_width": crossImageWidth,
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
    required this.cardType,
    required this.landingPage,
    required this.sourcePage,
    required this.cardId,
  });

  final String cardType;
  final String landingPage;
  final String sourcePage;
  final String cardId;

  factory EventValueMap.fromMap(Map<String, dynamic> json) => EventValueMap(
        cardType: json["card_type"],
        landingPage: json["landing_page"],
        sourcePage: json["source_page"],
        cardId: json["card_id"] == null ? null : json["card_id"],
      );

  Map<String, dynamic> toMap() => {
        "card_type": cardType,
        "landing_page": landingPage,
        "source_page": sourcePage,
        "card_id": cardId == null ? null : cardId,
      };
}

class Item {
  Item({
    required this.button,
    required this.bgColor,
    required this.image,
    required this.imageHeight,
    required this.titleColor,
    required this.name,
    required this.description,
    required this.id,
    required this.imageWidth,
    required this.title,
    required this.descriptionColor,
  });

  final Button button;
  final String bgColor;
  final String image;
  final int imageHeight;
  final String titleColor;
  final String name;
  final String description;
  final int id;
  final int imageWidth;
  final String title;
  final String descriptionColor;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        button: Button.fromMap(json["button"]),
        bgColor: json["bg_color"],
        image: json["image"],
        imageHeight: json["image_height"],
        titleColor: json["title_color"],
        name: json["name"],
        description: json["description"],
        id: json["id"],
        imageWidth: json["image_width"],
        title: json["title"],
        descriptionColor: json["description_color"],
      );

  Map<String, dynamic> toMap() => {
        "button": button.toMap(),
        "bg_color": bgColor,
        "image": image,
        "image_height": imageHeight,
        "title_color": titleColor,
        "name": name,
        "description": description,
        "id": id,
        "image_width": imageWidth,
        "title": title,
        "description_color": descriptionColor,
      };
}

class Button {
  Button({
    required this.btnTextColor,
    required this.btnBgColorStart,
    required this.btnBgColor,
    required this.btnBgColorEnd,
    required this.action,
    required this.btnText,
    required this.isGradient,
  });

  final String btnTextColor;
  final String btnBgColorStart;
  final String btnBgColor;
  final String btnBgColorEnd;
  final Action action;
  final String btnText;
  final bool isGradient;

  factory Button.fromMap(Map<String, dynamic> json) => Button(
        btnTextColor: json["btn_text_color"],
        btnBgColorStart: json["btn_bg_color_start"],
        btnBgColor: json["btn_bg_color"],
        btnBgColorEnd: json["btn_bg_color_end"],
        action: Action.fromMap(json["action"]),
        btnText: json["btn_text"],
        isGradient: json["is_gradient"],
      );

  Map<String, dynamic> toMap() => {
        "btn_text_color": btnTextColor,
        "btn_bg_color_start": btnBgColorStart,
        "btn_bg_color": btnBgColor,
        "btn_bg_color_end": btnBgColorEnd,
        "action": action.toMap(),
        "btn_text": btnText,
        "is_gradient": isGradient,
      };
}

class Action {
  Action({
    required this.route,
    required this.value,
    required this.eventFunnel,
    required this.eventsList,
  });

  final String route;
  final String value;
  final String eventFunnel;
  final List<EventsList> eventsList;

  factory Action.fromMap(Map<String, dynamic> json) => Action(
        route: json["route"],
        value: json["value"],
        eventFunnel: json["event_funnel"],
        eventsList: List<EventsList>.from(
            json["events_list"].map((x) => EventsList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "route": route,
        "value": value,
        "event_funnel": eventFunnel,
        "events_list": List<dynamic>.from(eventsList.map((x) => x.toMap())),
      };
}
