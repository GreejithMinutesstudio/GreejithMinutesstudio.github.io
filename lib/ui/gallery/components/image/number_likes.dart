import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/app_text.dart';

class NumberOfLikes extends StatelessWidget {
  final String likesCount;

  const NumberOfLikes({Key? key, required this.likesCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _likes();
  }

  Widget _likes() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.thumb_up_sharp,
          size: 14.0,
          color: AppColors.secondary,
        ),
        AppStyles.boxWidth2,
        TextPOP12W400("${likesCount}"),
      ],
    );
  }
}
