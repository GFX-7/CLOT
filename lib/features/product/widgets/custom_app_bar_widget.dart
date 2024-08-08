import 'package:clot/core/constants/color/color_const.dart';
import 'package:clot/core/constants/icons/icons_const.dart';
import 'package:clot/core/model/cloth_model.dart';
import 'package:clot/core/utils/check_current_mode.dart';
import 'package:clot/core/utils/hive_service.dart';
import 'package:clot/core/widgets/app_back_button.dart';
import 'package:clot/core/widgets/like_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    required this.model,
  });

  final ClothModel model;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 65,
      leading: AppBackButton(),
      actions: [
        StatefulBuilder(builder: (context, setState) {
          return LikeButton(
              onTap: () {
                if (HiveService.getAllLikedCloths().contains(model)) {
                  HiveService.unLikeCloth(model);
                } else {
                  HiveService.likeCloth(model);
                }
                setState(() {});
              },
              isLiked: HiveService.getAllLikedCloths().contains(model)
                  ? true
                  : false);
        })
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
