import 'dart:convert';

UsersReviewModel usersReviewModelFromMap(String str) =>
    UsersReviewModel.fromMap(json.decode(str));

String usersReviewModelToMap(UsersReviewModel data) =>
    json.encode(data.toMap());

class UsersReviewModel {
  UsersReviewModel({
    required this.scrollEvent,
    required this.items,
    required this.eventFunnel,
    required this.eventsList,
  });

  final ScrollEvent scrollEvent;
  final List<Item> items;
  final String eventFunnel;
  final List<ScrollEvent> eventsList;

  factory UsersReviewModel.fromMap(Map<String, dynamic> json) =>
      UsersReviewModel(
        scrollEvent: ScrollEvent.fromMap(json["scroll_event"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        eventFunnel: json["event_funnel"],
        eventsList: List<ScrollEvent>.from(
            json["events_list"].map((x) => ScrollEvent.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "scroll_event": scrollEvent.toMap(),
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "event_funnel": eventFunnel,
        "events_list": List<dynamic>.from(eventsList.map((x) => x.toMap())),
      };
}

class ScrollEvent {
  ScrollEvent({
    required this.event,
    required this.eventValueMap,
  });

  final String event;
  final EventValueMap eventValueMap;

  factory ScrollEvent.fromMap(Map<String, dynamic> json) => ScrollEvent(
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
    required this.starImage,
    required this.ratingColor,
    required this.role,
    required this.locationImageHeight,
    required this.rating,
    required this.roleImageWidth,
    required this.videoImage,
    required this.imageHeight,
    required this.videoUrl,
    required this.companyImage,
    required this.videoTitleColor,
    required this.review,
    required this.roleImage,
    required this.roleImageHeight,
    required this.nameColor,
    required this.reviewColor,
    required this.starImageHeight,
    required this.image,
    required this.roleColor,
    required this.locationImage,
    required this.locationImageWidth,
    required this.imageWidth,
    required this.videoPlayImageHeight,
    required this.companyImageHeight,
    required this.videoImageRatio,
    required this.videoPlayImageWidth,
    required this.videoTitle,
    required this.companyName,
    required this.name,
    required this.location,
    required this.videoPlayImage,
    required this.companyNameColor,
    required this.companyImageWidth,
    required this.locationColor,
    required this.starImageWidth,
  });

  final String starImage;
  final String ratingColor;
  final String role;
  final int locationImageHeight;
  final String rating;
  final int roleImageWidth;
  final String videoImage;
  final int imageHeight;
  final String videoUrl;
  final String companyImage;
  final String videoTitleColor;
  final String review;
  final String roleImage;
  final int roleImageHeight;
  final String nameColor;
  final String reviewColor;
  final int starImageHeight;
  final String image;
  final String roleColor;
  final String locationImage;
  final int locationImageWidth;
  final int imageWidth;
  final int videoPlayImageHeight;
  final String companyImageHeight;
  final double videoImageRatio;
  final int videoPlayImageWidth;
  final String videoTitle;
  final String companyName;
  final String name;
  final String location;
  final String videoPlayImage;
  final String companyNameColor;
  final String companyImageWidth;
  final String locationColor;
  final int starImageWidth;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        starImage: json["star_image"],
        ratingColor: json["rating_color"],
        role: json["role"],
        locationImageHeight: json["location_image_height"],
        rating: json["rating"],
        roleImageWidth: json["role_image_width"],
        videoImage: json["video_image"],
        imageHeight: json["image_height"],
        videoUrl: json["video_url"],
        companyImage: json["company_image"],
        videoTitleColor: json["video_title_color"],
        review: json["review"],
        roleImage: json["role_image"],
        roleImageHeight: json["role_image_height"],
        nameColor: json["name_color"],
        reviewColor: json["review_color"],
        starImageHeight: json["star_image_height"],
        image: json["image"],
        roleColor: json["role_color"],
        locationImage: json["location_image"],
        locationImageWidth: json["location_image_width"],
        imageWidth: json["image_width"],
        videoPlayImageHeight: json["video_play_image_height"],
        companyImageHeight: json["company_image_height"],
        videoImageRatio: json["video_image_ratio"].toDouble(),
        videoPlayImageWidth: json["video_play_image_width"],
        videoTitle: json["video_title"],
        companyName: json["company_name"],
        name: json["name"],
        location: json["location"],
        videoPlayImage: json["video_play_image"],
        companyNameColor: json["company_name_color"],
        companyImageWidth: json["company_image_width"],
        locationColor: json["location_color"],
        starImageWidth: json["star_image_width"],
      );

  Map<String, dynamic> toMap() => {
        "star_image": starImage,
        "rating_color": ratingColor,
        "role": role,
        "location_image_height": locationImageHeight,
        "rating": rating,
        "role_image_width": roleImageWidth,
        "video_image": videoImage,
        "image_height": imageHeight,
        "video_url": videoUrl,
        "company_image": companyImage,
        "video_title_color": videoTitleColor,
        "review": review,
        "role_image": roleImage,
        "role_image_height": roleImageHeight,
        "name_color": nameColor,
        "review_color": reviewColor,
        "star_image_height": starImageHeight,
        "image": image,
        "role_color": roleColor,
        "location_image": locationImage,
        "location_image_width": locationImageWidth,
        "image_width": imageWidth,
        "video_play_image_height": videoPlayImageHeight,
        "company_image_height": companyImageHeight,
        "video_image_ratio": videoImageRatio,
        "video_play_image_width": videoPlayImageWidth,
        "video_title": videoTitle,
        "company_name": companyName,
        "name": name,
        "location": location,
        "video_play_image": videoPlayImage,
        "company_name_color": companyNameColor,
        "company_image_width": companyImageWidth,
        "location_color": locationColor,
        "star_image_width": starImageWidth,
      };
}
