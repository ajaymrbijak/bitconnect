import 'package:bitchat/constants/constants.dart';
import 'package:bitchat/views/home/responsive_helper.dart';
import 'package:flutter/material.dart';

class CheckRatesUi extends StatefulWidget {
  const CheckRatesUi({super.key});

  @override
  State<CheckRatesUi> createState() => _CheckRatesUiState();
}

class _CheckRatesUiState extends State<CheckRatesUi> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text("MandiRated")),
      body: Responsive(
          mobile: Column(
            children: [
              buildCrouselBanner(screenWidth, screenHeight),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: buildTextCrousel()),
              // orientaion()
            ],
          ),
          tablet: Row(children: [
            const SizedBox(
              width: 10,
            ),
            buildCrouselBanner(screenWidth, screenHeight),
            const SizedBox(
              height: 20,
              width: 20,
            ),
            Expanded(child: buildTextCrousel())
          ]),
          desktop: Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              buildCrouselBanner(screenWidth, screenHeight),
              const SizedBox(
                height: 20,
                width: 20,
              ),
              Expanded(child: buildTextCrousel()),
              // orientaion()
            ],
          )),
    );
  }
}

Container buildCrouselBanner(double screenWidth, double screenHeight) {
  return Container(
    width: 190,
    height: 260,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(colors: [Colors.red, Colors.pink])),
    child: Center(
        child: Text(
      "Width :${screenWidth.toString()}\nHeight:${screenHeight.toString()}",
      style: const TextStyle(color: Colors.white, fontSize: 25),
    )),
  );
}

Text buildTextCrousel() {
  return const Text(
      'Hi there 🤝 \n\nHere the rates are reasonable and this commodities prices to availble to clain prices to the endusers   \nYou can buy products\nIt\'s an ecosystem that builds to provide quality and good products that enrich each and every indian who are used this appilcation ',
      style: TextStyle(fontSize: 24));
}

Row orientaion() {
  return Row(
    children: [
      Container(
        width: 100,
        height: 200,
        decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 38, 247, 35),
          Color.fromARGB(255, 4, 240, 220)
        ])),
        child: Text("SideBar", style: textdeco),
      ),
      Container(
        width: 100,
        height: 200,
        decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 209, 218, 209),
          Color.fromARGB(255, 4, 142, 240)
        ])),
        child: Text("Content", style: textdeco),
      )
    ],
  );
}

OrientationBuilder orientationBuilder() {
  return OrientationBuilder(
    builder: (BuildContext context, Orientation orientation) {
      final isPortrait = orientation == Orientation.portrait;
      return isPortrait
          ? Container(
              color: Colors.blue,
              child: Text(
                'Portrait',
                style: textdeco,
              ),
            )
          : Container(
              color: Colors.green,
              child: Text(
                'Landscape ',
                style: textdeco,
              ),
            );
    },
  );
}
