import 'package:flutter/material.dart';
import '../../../../models/image_model.dart';
import 'full_screen_image.dart';

class ImageDetail extends StatelessWidget {
  final ImageModel imageModel;

  const ImageDetail({Key? key, required this.imageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FullScreenImage(imageUrl: imageModel.imageUrl ?? ""));
  }
}
