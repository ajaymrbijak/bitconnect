import 'package:bitchat/constants/constants.dart';
import 'package:bitchat/controllers/api_controller.dart';
import 'package:bitchat/models/homecardmodels/componentscardmodels/mandi_rates.dart';
import 'package:bitchat/views/home/respionsive_rates_check.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../models/homecardmodels/componentscardmodels/comman_cards_data.dart';

class MandiRatesView extends StatelessWidget {
  final MandiRatesModel mandirates;
  final CommonCardModel commondData;
  MandiRatesView(
      {super.key, required this.mandirates, required this.commondData});

  ApiResponseController apiResponseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade50,
      height: 420,
      padding: const EdgeInsets.only(left: 15, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(commondData.title ?? "", style: textdeco.copyWith(fontSize: 25)),
          Text(commondData.subTitle ?? "",
              style: textdeco.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: Colors.black54)),
          const SizedBox(height: 10),
          SizedBox(
            height: 260,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mandirates.items.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: SizedBox(
                                    height: 140,
                                    child: Image.network(
                                        mandirates.items[index].image)),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: SizedBox(
                                    width: 100,
                                    child: Text(
                                      mandirates.items[index].title,
                                      textAlign: TextAlign.center,
                                      style: textdeco.copyWith(
                                          fontSize: 18,
                                          overflow: TextOverflow.clip,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              onPressed: () {
                Get.to(const CheckRatesUi());
              },
              child: Text(
                mandirates.button.btnText,
                style: textdeco.copyWith(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
