import 'package:bitchat/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/api_controller.dart';
import '../../../models/homecardmodels/componentscardmodels/bijak_market_place.dart';
import '../../../models/homecardmodels/componentscardmodels/comman_cards_data.dart';

class BijakMarketPlaceCardView extends StatefulWidget {
  final BijakMarketPlaceModel marketModel;
  final CommonCardModel commonCardModel;

  const BijakMarketPlaceCardView(
      {super.key, required this.marketModel, required this.commonCardModel});

  @override
  State<BijakMarketPlaceCardView> createState() =>
      _BijakMarketPlaceCardViewState();
}

class _BijakMarketPlaceCardViewState extends State<BijakMarketPlaceCardView> {
  ApiResponseController apiResponseController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 742,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.commonCardModel.title ?? "",
              style: textdeco.copyWith(fontSize: 16, color: Colors.black87),
            ),
            Text(
              widget.commonCardModel.subTitle ?? "",
              style: textdeco,
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 150 / 220,
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: SizedBox(
                            height: 100,
                            child: Image.asset("images/bg.jpeg"),
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 70),
                            child: Card(
                                color: Colors.blue.shade50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Text(
                                  "09 Nov 2022",
                                  style: textdeco.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 14),
                                )),
                          ),
                          Text(
                            "Kadapa",
                            textAlign: TextAlign.left,
                            style: textdeco.copyWith(fontSize: 16),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_pin,
                                  color: Colors.black87, size: 16),
                              const SizedBox(
                                width: 4,
                              ),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  "Rayachoty,Veeraballi",
                                  style: textdeco.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black45,
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              )
                            ],
                          ),
                          const Text(
                              "...........................................",
                              style: TextStyle(color: Colors.black45)),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Maize",
                            style: textdeco.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          Text(
                            "₹1000",
                            style: textdeco.copyWith(
                                color: Colors.black54, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: TextButton(
              onPressed: () {},
              child: Text(
                widget.marketModel.button.btnText,
                style: textdeco.copyWith(
                    color: Colors.green, fontWeight: FontWeight.w500),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
