class CommonCardModel {
  int? cardType;
  String? id;
  String? title;
  String? viewType;
  String? subTitle;
  String? bgColor;
  String? bgImage;
  String? titleColor;
  String? subTitleColor;
  String? widgetType;
  int? aspectRatio;
  final String? borderColor;
  final dynamic items;
  final int? cardPosition;

  CommonCardModel({
    this.cardType,
    this.id,
    this.title,
    this.viewType,
    this.subTitle,
    this.bgColor,
    this.bgImage,
    this.titleColor,
    this.subTitleColor,
    this.widgetType,
    this.aspectRatio,
    this.borderColor,
    this.items,
    this.cardPosition,
  });

  factory CommonCardModel.fromJson(Map<String, dynamic> json) {
    return CommonCardModel(
        cardType: json['card_type'],
        id: json['id'],
        title: json['title'],
        viewType: json['view_type'],
        subTitle: json['sub_title'],
        bgColor: json['bg_color'],
        bgImage: json['bg_image'],
        titleColor: json['title_color'],
        subTitleColor: json['sub_title_color'],
        widgetType: json['widget_type'],
        aspectRatio: json['aspect_ratio'].toInt(),
        borderColor: json["border_color"],
        items: json["items"],
        cardPosition: json["card_position"]);
  }

  Map<String, dynamic> toMap() => {
        "card_type": cardType,
        "id": id,
        "title": title,
        "view_type": viewType,
        "sub_title": subTitle,
        "bg_color": bgColor,
        "bg_image": bgImage,
        "title_color": titleColor,
        "sub_title_color": subTitleColor,
        "widget_type": widgetType,
        "aspect_ratio": aspectRatio,
        "border_color": borderColor,
        "items": items,
        "card_position": cardPosition,
      };
}
