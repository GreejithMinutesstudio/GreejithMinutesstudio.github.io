import 'package:flutter/material.dart';

import '../../../../constants/app_styles.dart';
import '../../../../main.dart';
import '../../../../models/image_model.dart';
import '../../../../widgets/viewers/network_image.dart';
import 'image_detail.dart';
import 'number_likes.dart';
import 'number_views.dart';

class ImageTile extends StatelessWidget {
  final ImageModel item;

  const ImageTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.push(
            navigatorKey.currentContext!,
            MaterialPageRoute(
                builder: (context) => ImageDetail(
                      imageModel: item,
                    )));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(),
          AppStyles.boxHeightMicro,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NumberOfLikes(
                  likesCount: item.likes?.toString() ?? "",
                ),
                NumberOfViews(
                  viewCount: item.views?.toString() ?? "",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return AspectRatio(
        aspectRatio: 1,
        child: NetworkImageWidget(url: item.imageUrl, width: double.infinity));
  }
}
