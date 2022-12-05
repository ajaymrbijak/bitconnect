import 'package:bitchat/constants/constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/api_controller.dart';
import '../../../models/homecardmodels/componentscardmodels/comman_cards_data.dart';
import '../../../models/homecardmodels/componentscardmodels/today_buy_sell.dart';

class BuySellCardView extends StatefulWidget {
  final CommonCardModel commonCardModel;
  final BuySellCardModel buysellModel;

  const BuySellCardView(
      {super.key, required this.commonCardModel, required this.buysellModel});

  @override
  State<BuySellCardView> createState() => _BuySellCardViewState();
}

class _BuySellCardViewState extends State<BuySellCardView> {
  ApiResponseController apiResponseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.green.shade800,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          )),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          height: 88,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.green.shade800,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 60,
              ),
              Text(
                widget.commonCardModel.title ?? "",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                widget.commonCardModel.subTitle ?? "",
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 18, top: 25.0),
          height: 166,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.green.shade600,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10))),
          child: Row(
            children: [
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: SizedBox(
                        width: 78,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        widget.buysellModel.button.image),
                                    backgroundColor: Colors.white,
                                    radius: 37),
                                const SizedBox(
                                  height: 2,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Item$index",
                                      style: textdeco.copyWith(
                                          color: Colors.white,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 37,
                    backgroundColor: Colors.green.shade900,
                    child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(widget.buysellModel.button.image),
                        backgroundColor: Colors.green.shade900,
                        radius: 23),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Other",
                        style: textdeco.copyWith(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
