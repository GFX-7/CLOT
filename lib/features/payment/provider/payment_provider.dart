import 'package:clot/core/constants/color/color_const.dart';
import 'package:clot/core/model/payment_model.dart';
import 'package:clot/core/utils/hive_service.dart';
import 'package:clot/core/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  List<PaymentModel> cards = [];

  void getCards() async {
    cards = await HiveService.getAllPaymentCards();
  }

  void addCard(
      {required String cvv,
      required exp,
      required cardHolderName,
      required cardNumber,
      required BuildContext context}) {
    final startFour = cardNumber.substring(0, 4);
    Karta karta = int.parse(startFour) == 9860 ? Karta.humo : Karta.uzcard;
    HiveService.savePaymentCard(PaymentModel(
        cardHolderName: cardHolderName,
        karta: karta,
        cardNuber: cardNumber,
        ccv: int.parse(cvv),
        expDate: int.parse(exp.trim().replaceAll('/', '').toString())));
    showCustomSnackBar(
        context: context,
        message: 'Card has been added !',
        backgroundColor: ColorConst.green);
    getCards();
    Navigator.pop(context);
    notifyListeners();
  }
}
