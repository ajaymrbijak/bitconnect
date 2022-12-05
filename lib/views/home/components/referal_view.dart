import 'package:bitchat/models/homecardmodels/componentscardmodels/comman_cards_data.dart';
import 'package:bitchat/models/homecardmodels/componentscardmodels/referal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/constants.dart';

class ReferalCardView extends StatelessWidget {
  final CommonCardModel commonCardModel;
  final ReferalCardModel referal;
  const ReferalCardView(
      {super.key, required this.commonCardModel, required this.referal});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 0, 68, 185),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(referal.title,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow.shade700)),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      referal.subTitle,
                      style: textdeco.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Expanded(
                  child: SvgPicture.network(
                    referal.image,
                    height: 130,
                    width: 100,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 0, 5, 93)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
                  onPressed: () {},
                  child: Text(referal.buttons[0].btnText.toString(),
                      style: TextStyle(fontSize: 15))),
              const SizedBox(width: 10),
              TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                  width: 3, color: Colors.yellow.shade800)))),
                  onPressed: () {},
                  child: Text(referal.buttons[1].btnText.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ))),
            ]),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
