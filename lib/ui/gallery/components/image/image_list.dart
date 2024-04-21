import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_enums.dart';
import '../../../../constants/app_text.dart';
import '../../../../main.dart';
import '../../../../models/image_model.dart';
import '../../../../providers/home_provider.dart';
import '../../../../widgets/loaders/custom_loader.dart';
import 'image_tile.dart';
import 'package:tuple/tuple.dart';

class ImageList extends StatefulWidget {
  ImageList({Key? key}) : super(key: key);

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  final HomeProvider homeProvider =
      Provider.of<HomeProvider>(navigatorKey.currentContext!, listen: false);

  @override
  void initState() {
    homeProvider.initList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _imageList();
  }

  Widget _imageList() {
    return Selector<HomeProvider, Tuple3<PageStatus, List<ImageModel>, int>>(
        selector: (buildContext, controller) => Tuple3(
              controller.pageStatus,
              controller.imageList,
              controller.totalCount,
            ),
        shouldRebuild: (Tuple3<PageStatus, List<ImageModel>?, int> before,
            Tuple3<PageStatus, List<ImageModel>?, int> after) {
          return true;
        },
        builder:
            (context, Tuple3<PageStatus, List<ImageModel>, int> data, child) {
          if (data.item1 == PageStatus.loading) {
            return CustomLoader();
          } else {
            int crossAxisCount =
                MediaQuery.of(navigatorKey.currentContext!).size.width ~/ 150;
            return data.item2.length > 0
                ? LoadMore(
                    isFinish: data.item2.length >= data.item3,
                    onLoadMore: homeProvider.loadMore,
                    textBuilder: DefaultLoadMoreTextBuilder.english,
                    child: ListView.builder(
                      itemCount: data.item2.length ~/ crossAxisCount,
                      padding: EdgeInsets.fromLTRB(8, 14, 8, 14),
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return Row(
                          children: List.generate(
                              crossAxisCount,
                              (index) => Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 8),
                                    child: ImageTile(
                                      item: data.item2.elementAt(
                                          (i * crossAxisCount) + index),
                                    ),
                                  ))),
                        );
                      },
                    ),
                  )
                : data.item2.length == 0
                    ? Center(
                        child: TextPOP14W400("No Data Found..."),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primaryDark),
                      );
          }
        });
  }
}
