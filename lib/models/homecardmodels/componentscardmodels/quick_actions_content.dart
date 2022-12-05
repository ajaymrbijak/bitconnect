import 'dart:convert';

QuickActionsModel quickActionsModelFromMap(String str) =>
    QuickActionsModel.fromMap(json.decode(str));

String quickActionsModelToMap(QuickActionsModel data) =>
    json.encode(data.toMap());

class QuickActionsModel {
  QuickActionsModel({
    required this.color,
    required this.size,
    required this.titleColor,
    required this.image,
    required this.imageType,
    required this.imageHeight,
    required this.imageWidth,
    required this.action,
    required this.items,
    required this.childAspectRatio,
    required this.crossAxisCount,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
  });

  final String color;
  final String size;
  final String titleColor;
  final String image;
  final dynamic imageType;
  final dynamic imageHeight;
  final dynamic imageWidth;
  final QuickActionsModelAction action;
  final List<Item> items;
  final int childAspectRatio;
  final int crossAxisCount;
  final int mainAxisSpacing;
  final int crossAxisSpacing;

  factory QuickActionsModel.fromMap(Map<String, dynamic> json) =>
      QuickActionsModel(
        color: json["color"],
        size: json["size"],
        titleColor: json["title_color"],
        image: json["image"],
        imageType: json["image_type"],
        imageHeight: json["image_height"],
        imageWidth: json["image_width"],
        action: QuickActionsModelAction.fromMap(json["action"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        childAspectRatio: json["child_aspect_ratio"],
        crossAxisCount: json["cross_axis_count"],
        mainAxisSpacing: json["main_axis_spacing"],
        crossAxisSpacing: json["cross_axis_spacing"],
      );

  Map<String, dynamic> toMap() => {
        "color": color,
        "size": size,
        "title_color": titleColor,
        "image": image,
        "image_type": imageType,
        "image_height": imageHeight,
        "image_width": imageWidth,
        "action": action.toMap(),
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "child_aspect_ratio": childAspectRatio,
        "cross_axis_count": crossAxisCount,
        "main_axis_spacing": mainAxisSpacing,
        "cross_axis_spacing": crossAxisSpacing,
      };
}

class QuickActionsModelAction {
  QuickActionsModelAction({
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
  final EventFunnel eventFunnel;
  final List<PurpleEventsList> eventsList;
  final String value;
  final String route;

  factory QuickActionsModelAction.fromMap(Map<String, dynamic> json) =>
      QuickActionsModelAction(
        id: json["id"],
        event: json["event"],
        eventValueMap: json["event_value_map"],
        eventFunnel: eventFunnelValues.map[json["event_funnel"]]!,
        eventsList: List<PurpleEventsList>.from(
            json["events_list"].map((x) => PurpleEventsList.fromMap(x))),
        value: json["value"],
        route: json["route"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "event": event,
        "event_value_map": eventValueMap,
        "event_funnel": eventFunnelValues.reverse[eventFunnel],
        "events_list": List<dynamic>.from(eventsList.map((x) => x.toMap())),
        "value": value,
        "route": route,
      };
}

enum EventFunnel { HOME }

final eventFunnelValues = EnumValues({"home": EventFunnel.HOME});

class PurpleEventsList {
  PurpleEventsList({
    required this.event,
    required this.eventValueMap,
  });

  final String event;
  final PurpleEventValueMap eventValueMap;

  factory PurpleEventsList.fromMap(Map<String, dynamic> json) =>
      PurpleEventsList(
        event: json["event"],
        eventValueMap: PurpleEventValueMap.fromMap(json["event_value_map"]),
      );

  Map<String, dynamic> toMap() => {
        "event": event,
        "event_value_map": eventValueMap.toMap(),
      };
}

class PurpleEventValueMap {
  PurpleEventValueMap({
    required this.landingPage,
    required this.sourcePage,
    required this.bannerName,
    required this.bannerPosition,
    required this.type,
    required this.totalBanner,
  });

  final String landingPage;
  final EventFunnel sourcePage;
  final String bannerName;
  final int bannerPosition;
  final String type;
  final int totalBanner;

  factory PurpleEventValueMap.fromMap(Map<String, dynamic> json) =>
      PurpleEventValueMap(
        landingPage: json["landing_page"],
        sourcePage: eventFunnelValues.map[json["source_page"]]!,
        bannerName: json["banner_name"],
        bannerPosition: json["banner_position"],
        type: json["type"],
        totalBanner: json["total_banner"],
      );

  Map<String, dynamic> toMap() => {
        "landing_page": landingPage,
        "source_page": eventFunnelValues.reverse[sourcePage],
        "banner_name": bannerName,
        "banner_position": bannerPosition,
        "type": type,
        "total_banner": totalBanner,
      };
}

class Item {
  Item({
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
  final ItemAction action;
  final int id;
  final int imageWidth;
  final String title;
  final ImageType imageType;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        image: json["image"],
        imageHeight: json["image_height"],
        titleColor: titleColorValues.map[json["title_color"]]!,
        action: ItemAction.fromMap(json["action"]),
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

class ItemAction {
  ItemAction({
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
  final List<FluffyEventsList> eventsList;

  factory ItemAction.fromMap(Map<String, dynamic> json) => ItemAction(
        id: json["id"],
        route: json["route"],
        value: json["value"],
        eventFunnel: json["event_funnel"],
        eventsList: List<FluffyEventsList>.from(
            json["events_list"].map((x) => FluffyEventsList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "route": route,
        "value": value,
        "event_funnel": eventFunnel,
        "events_list": List<dynamic>.from(eventsList.map((x) => x.toMap())),
      };
}

class FluffyEventsList {
  FluffyEventsList({
    required this.event,
    required this.eventValueMap,
  });

  final Event event;
  final FluffyEventValueMap eventValueMap;

  factory FluffyEventsList.fromMap(Map<String, dynamic> json) =>
      FluffyEventsList(
        event: eventValues.map[json["event"]]!,
        eventValueMap: FluffyEventValueMap.fromMap(json["event_value_map"]),
      );

  Map<String, dynamic> toMap() => {
        "event": eventValues.reverse[event],
        "event_value_map": eventValueMap.toMap(),
      };
}

enum Event { MOB_QUICK_ACTION_CLICK }

final eventValues =
    EnumValues({"mob_quick_action_click": Event.MOB_QUICK_ACTION_CLICK});

class FluffyEventValueMap {
  FluffyEventValueMap({
    required this.landingPage,
    required this.sourcePage,
    required this.iconName,
    required this.iconPosition,
  });

  final String landingPage;
  final EventFunnel sourcePage;
  final String iconName;
  final int iconPosition;

  factory FluffyEventValueMap.fromMap(Map<String, dynamic> json) =>
      FluffyEventValueMap(
        landingPage: json["landing_page"],
        sourcePage: eventFunnelValues.map[json["source_page"]]!,
        iconName: json["icon_name"],
        iconPosition: json["icon_position"],
      );

  Map<String, dynamic> toMap() => {
        "landing_page": landingPage,
        "source_page": eventFunnelValues.reverse[sourcePage],
        "icon_name": iconName,
        "icon_position": iconPosition,
      };
}

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
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap!;
  }
}
