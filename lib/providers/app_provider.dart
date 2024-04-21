import 'dart:async';
import 'package:flutter/material.dart';

import '../constants/app_enums.dart';
import '../ui/gallery/gallery.dart';

class AppProvider with ChangeNotifier {
  PageStatus _pageStatus = PageStatus.initial;

  PageStatus get pageStatus => _pageStatus;

  set pageStatus(PageStatus newState) {
    _pageStatus = newState;
    notifyListeners();
  }

  void refreshData(BuildContext context) {
    _pageStatus = PageStatus.loading;
    fetchAppDetails(context);
  }

  Future<void> fetchAppDetails(BuildContext context) async {
    _pageStatus = PageStatus.loading;
    await Future.delayed(const Duration(seconds: 3));
    await loadGallery(context);
  }

  Future<void> loadGallery(BuildContext context) async {
    pageStatus = PageStatus.loaded;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Gallery(),
        ),
            (Route<dynamic> route) => false);
  }
}
