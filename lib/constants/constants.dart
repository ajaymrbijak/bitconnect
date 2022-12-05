import 'package:flutter/material.dart';

TextStyle textdeco = const TextStyle(
    decoration: TextDecoration.none,
    color: Color.fromARGB(255, 0, 0, 0),
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold);

enum CardType {
  QUICK_ACTIONS,
  BUY_SELL_CARD,
  MARKET_PLACE_CARD,
  MANDIRATES_CARD,
  REFERAL,
}

const mobileWidth = 600;



                // const QuickActionView(),
                // const PosterCardView(),
                // const BuySellCardView(),
                //const SizedBox(height: 20),
                // const BijakMarketPlace(),
                // const MandiRatesView(),
                // const SizedBox(height: 10),
                // const ReferalCardView()