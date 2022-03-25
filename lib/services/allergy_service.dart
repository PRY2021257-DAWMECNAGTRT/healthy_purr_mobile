import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:healthy_purr_mobile_app/models/model.dart';
import 'package:healthy_purr_mobile_app/services/service.dart';
import 'package:healthy_purr_mobile_app/utils/util.dart';
import 'package:healthy_purr_mobile_app/view_models/view_model.dart';

class AllergyService with ChangeNotifier {

  Future<List<Allergy>> getAllAllergies() async {

    final dio = Dio();

    var uri = '${url}allergics';

    var response = await dio.get(uri, options: Options(
        headers: HeadersService().getHeaders()
    ));

    if (response.statusCode == 200) {
      List body = response.data["data"].map((e) => Allergy.formJson(e)).toList();
      var data = body.cast<Allergy>();
      return data;
    }

    return [];

  }

  Future<List<CatAllergyDto>> getCatAllergies(CatViewModel cat) async {

    final dio = Dio();

    var uri = '${url}cats/${cat.catId}/allergics';

    var response = await dio.get(uri, options: Options(
        headers: HeadersService().getHeaders()
    ));

    if (response.statusCode == 200) {
      List body = response.data["data"].map((e) => CatAllergyDto.fromJson(e)).toList();
      var data = body.cast<CatAllergyDto>();
      return data;
    }

    return [];

  }

}