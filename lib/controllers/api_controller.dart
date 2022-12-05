import 'package:get/get.dart';
import '../api/apis.dart';
import '../models/homecardmodels/card_model.dart';

class ApiResponseController extends GetxController {
  Rx<bool> isDataLoading = true.obs;
  List<CardModel>? listOfCards = [];
  void fetchApiCard() async {
    final response = await homeApi();
    final responseData = response['data'] ?? {};
    final cardsDataList = responseData['cards'] ?? [];
    listOfCards = List<CardModel>.from(
        cardsDataList.map((item) => CardModel.fromMap(item)));
    print(listOfCards);
    isDataLoading.value = false;
  }
}
