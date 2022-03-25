import 'package:flutter/cupertino.dart';
import 'package:healthy_purr_mobile_app/services/service.dart';

import '../../models/model.dart';
import '../../view_models/view_model.dart';

class CatListViewModel {

  final List<CatViewModel> _catList = [];

  final List<NetworkImage> _catImages = [];

  late CatViewModel selectedCat;

  List<CatViewModel> getCats() {
    return _catList;
  }

  List<NetworkImage> getCatsImages() {
    return _catImages;
  }

  Future<void> populateCatList(BuildContext context) async {
    final userId = UserSession().id;

    List<Cat> auxCatList = await CatService().getCatsByUserId(userId.toString());

    for(var cat in auxCatList) {
      _catList.add(CatViewModel(cat: cat));
    }

  }

  Future<void> populateCatsImages(BuildContext context) async {

    List<NetworkImage> auxList = [];

    for(var cat in _catList) {
      auxList.add(await CatService().getCatImage(cat));
    }

    for(var image in auxList) {
      _catImages.add(image);
    }

  }

}