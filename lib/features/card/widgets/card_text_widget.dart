import 'package:clot/core/constants/color/color_const.dart';
import 'package:clot/core/utils/check_current_mode.dart';
import 'package:clot/features/card/provider/card_provider.dart';
import 'package:clot/features/home/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardTextWidget extends StatelessWidget {
  const CardTextWidget({
    super.key,
    required this.title,
    required this.amount,
  });

  final String title;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: checkModeAndGiveColor(
                    mode: MediaQuery.of(context).platformBrightness,
                    lightColor: ColorConst.darkGrey,
                    darkColor: ColorConst.textGrey)),
          ),
          Text(
            context.watch<CardProvider>().cardList.isNotEmpty
                ? '\$$amount'
                : '\$0.0',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
