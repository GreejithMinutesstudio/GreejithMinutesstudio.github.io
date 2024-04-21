import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_strings.dart';
import '../../constants/app_text.dart';
import '../../main.dart';
import '../../providers/app_provider.dart';
import '../../providers/home_provider.dart';
import '../../utils/widget_utils.dart';

import 'components/image/image_list.dart';
import 'components/search.dart';

class Gallery extends StatefulWidget {
  const Gallery({
    super.key,
  });

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final AppProvider appProvider =
      Provider.of<AppProvider>(navigatorKey.currentContext!, listen: false);
  final HomeProvider homeProvider =
      Provider.of<HomeProvider>(navigatorKey.currentContext!, listen: false);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => WidgetUtils.showExitPopUp(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(),
        body: ImageList(),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 60);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const TextPOP26W700(AppStrings.gallery),
        Search(),
      ],
    );
  }
}
