import 'package:bitchat/models/homecardmodels/componentscardmodels/bijak_market_place.dart';
import 'package:bitchat/models/homecardmodels/componentscardmodels/quick_actions_content.dart';
import '../../constants/constants.dart';
import 'componentscardmodels/mandi_rates.dart';
import 'componentscardmodels/referal_card.dart';
import 'componentscardmodels/today_buy_sell.dart';
import 'componentscardmodels/comman_cards_data.dart';

class CardModel {
  CommonCardModel? commonData;
  dynamic cardData;
  CardType? cardTypeName;
  CardModel({this.cardData, this.cardTypeName, this.commonData});
  factory CardModel.fromMap(Map<String, dynamic> json) {
    int cardInt = json['card_type'];

    CardModel cardModel = CardModel(commonData: CommonCardModel.fromJson(json));

    if (cardInt == 21) {
      cardModel.cardTypeName = CardType.QUICK_ACTIONS;
      cardModel.cardData = QuickActionsModel.fromMap(json['content']);
    } else if (cardInt == 22) {
      cardModel.cardTypeName = CardType.BUY_SELL_CARD;
      cardModel.cardData = BuySellCardModel.fromMap(json['content']);
    } else if (cardInt == 24) {
      cardModel.cardTypeName = CardType.MARKET_PLACE_CARD;
      cardModel.cardData = BijakMarketPlaceModel.fromMap(json['content']);
    } else if (cardInt == 8) {
      cardModel.cardTypeName = CardType.MANDIRATES_CARD;
      cardModel.cardData = MandiRatesModel.fromMap(json['content']);
    } else if (cardInt == 29) {
      cardModel.cardTypeName = CardType.REFERAL;
      cardModel.cardData = ReferalCardModel.fromMap(json['content']);
    }

    return cardModel;
  }
}
