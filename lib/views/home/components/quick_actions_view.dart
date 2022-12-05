import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controllers/api_controller.dart';
import '../../../models/homecardmodels/componentscardmodels/comman_cards_data.dart';
import '../../../models/homecardmodels/componentscardmodels/quick_actions_content.dart';

class QuickActionView extends StatefulWidget {
  final CommonCardModel commonCardModel;
  final QuickActionsModel quickActions;

  const QuickActionView(
      {super.key, required this.commonCardModel, required this.quickActions});

  @override
  State<QuickActionView> createState() => _QuickActionViewState();
}

class _QuickActionViewState extends State<QuickActionView> {
  ApiResponseController apiResponseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (apiResponseController.isDataLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SizedBox(
          height: 230,
          width: double.infinity,
          child: Card(
            margin: const EdgeInsets.all(3),
            color: Colors.green.shade50,
            elevation: 5.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: apiResponseController.listOfCards?.length,
                  itemBuilder: (ctx, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: widget.quickActions.items.length,
                          itemBuilder: (context, i) {
                            return Column(children: [
                              GestureDetector(
                                onDoubleTap: () {},
                                child: SvgPicture.network(
                                  widget.quickActions.items[i].image,
                                ),
                              ),
                              Text(widget.quickActions.items[i].title),
                            ]);
                          }),
                    );
                  }),
            ),
          ),
        );
      },
    );
  }
}
