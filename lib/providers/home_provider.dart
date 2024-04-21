import 'package:flutter/material.dart';

import '../api_services/http_api_client.dart';
import '../constants/app_enums.dart';
import '../models/image_model.dart';

class HomeProvider with ChangeNotifier {
  PageStatus _pageStatus = PageStatus.initial;

  PageStatus get pageStatus => _pageStatus;

  set pageStatus(PageStatus newState) {
    _pageStatus = newState;
    notifyListeners();
  }

  List<ImageModel> imageList = [];
  bool isLoadingMore = false;
  int totalCount = 0;
  int page = 1;

  final TextEditingController searchTC = TextEditingController();

 Future<bool> loadMore()  async {
   print("loadMore $isLoadingMore");
    if (totalCount > imageList.length && isLoadingMore != true) {
      print("loadMore true");
      isLoadingMore = true;
      page++;
      return getData();
    }
    return false;
  }

  initList() async {
    searchTC.clear();
    _pageStatus = PageStatus.loading;
    searchInList();
  }
  searchInList({String? value}) async {
    isLoadingMore = false;
    imageList.clear();
    page = 1;
    if( pageStatus != PageStatus.loading){
      pageStatus = PageStatus.loading;
    }
    getData(value: value);
  }

  Future<bool> getData({String? value}) async {
    try {
      var response = await httpRequest(
          urlAddress:
              "${value?.isNotEmpty == true? value : 'classic'}&image_type=photo&page=$page",
          httpMethod: HttpMethod.get);
      ImageModelListResponse imageModelListResponse =
          await ImageModelListResponse.fromJson(response);
      if(page == 1){
        imageList = imageModelListResponse.imageList;
      }else{
        imageList.addAll(imageModelListResponse.imageList );
      }

      totalCount = imageModelListResponse.totalCount ?? 0;
      isLoadingMore = false;
      pageStatus = PageStatus.loaded;
      print("api hit success");
      print(totalCount);
      print(imageList.length);
      return true;
    } catch (e) {
      debugPrint('getData  Error : $e');
      isLoadingMore = false;
      pageStatus = PageStatus.loadingFailed;
      return false;
    }
  }
}
