import 'package:bitchat/constants/constants.dart';
import 'package:bitchat/controllers/api_controller.dart';
import 'package:bitchat/models/homecardmodels/componentscardmodels/bijak_market_place.dart';
import 'package:bitchat/models/homecardmodels/componentscardmodels/mandi_rates.dart';
import 'package:bitchat/models/homecardmodels/componentscardmodels/quick_actions_content.dart';
import 'package:bitchat/models/homecardmodels/componentscardmodels/referal_card.dart';
import 'package:bitchat/views/home/components/quick_actions_view.dart';
import 'package:bitchat/views/home/components/referal_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/homecardmodels/card_model.dart';
import '../../models/homecardmodels/componentscardmodels/today_buy_sell.dart';
import 'components/bijak_market_placecard_view.dart';
import 'components/buy_sell_card_view.dart';
import 'components/mandi_rates_view.dart';

class HomeConfigDashboard extends StatefulWidget {
  const HomeConfigDashboard({super.key});

  @override
  State<HomeConfigDashboard> createState() => _HomeConfigDashboardState();
}

class _HomeConfigDashboardState extends State<HomeConfigDashboard> {
  ApiResponseController apiResponseController =
      Get.put(ApiResponseController());

  @override
  void initState() {
    super.initState();
    apiResponseController.fetchApiCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "BIJAK",
          style: textdeco.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              color: const Color.fromARGB(255, 46, 145, 7)),
        ),
        titleSpacing: 3,
        automaticallyImplyLeading: false,
        leadingWidth: 60,
        leading: Image.asset("images/bijakLogo.png"),
        actions: [
          IconButton(
              color: Colors.black87,
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                size: 30,
              )),
          const SizedBox(
            width: 3,
          ),
          IconButton(
            color: Colors.black87,
            icon: const Icon(Icons.call, size: 22),
            onPressed: () {},
          ),
          Center(
              child: Text("Help",
                  style: textdeco.copyWith(color: Colors.black87))),
          const SizedBox(
            width: 25,
          ),
          const CircleAvatar(
            backgroundColor: Colors.black12,
            foregroundColor: Colors.black,
            child: Icon(Icons.person),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Obx(
        () {
          if (apiResponseController.isDataLoading.value == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if ((apiResponseController.listOfCards ?? []).isEmpty) {
            return const Center(child: Text("Cards Data Not Found In tha API"));
          }
          return ListView.builder(
            itemCount: apiResponseController.listOfCards!.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              CardModel model = apiResponseController.listOfCards![index];
              if (model.cardTypeName == CardType.QUICK_ACTIONS &&
                  model.cardData != null) {
                QuickActionsModel quickActions = model.cardData;
                return Column(
                  children: [
                    const SizedBox(
                      height: 130,
                    ),
                    QuickActionView(
                      quickActions: quickActions,
                      commonCardModel: model.commonData!,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 20, right: 20),
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                );
              } else if (model.cardTypeName == CardType.BUY_SELL_CARD &&
                  model.cardData != null) {
                BuySellCardModel buysell = model.cardData;
                return BuySellCardView(
                  buysellModel: buysell,
                  commonCardModel: model.commonData!,
                );
              } else if (model.cardTypeName == CardType.MARKET_PLACE_CARD &&
                  model.cardData != null) {
                BijakMarketPlaceModel marketmodelData = model.cardData;
                return BijakMarketPlaceCardView(
                  marketModel: marketmodelData,
                  commonCardModel: model.commonData!,
                );
              } else if (model.cardTypeName == CardType.MANDIRATES_CARD &&
                  model.cardData != null) {
                MandiRatesModel mandirates = model.cardData;
                return MandiRatesView(
                  mandirates: mandirates,
                  commondData: model.commonData!,
                );
              } else if (model.cardTypeName == CardType.REFERAL &&
                  model.cardData != null) {
                ReferalCardModel refer = model.cardData;
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ReferalCardView(
                      referal: refer,
                      commonCardModel: model.commonData!,
                    ),
                  ],
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }
}
