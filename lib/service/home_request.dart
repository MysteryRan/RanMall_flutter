import 'package:RanMall_flutter/model/home_model.dart';
import '../service/http_request.dart';

class HomeRequest {
  static Future<List<CategoryModel>> requestCategory() async {
    final result = await HttpRequest.six6dRequest("http://18sheng.71baomu.com/app/home/icon?key=",
                                            method: 'post',
                                            params:{'shop_id':42});
    final subjects = result["data"];
    List<CategoryModel> categorys = [];
    for (var sub in subjects) {
      categorys.add(CategoryModel.fromJson(sub));
    }
    return categorys;
  }

  static Future<List<HomeGoodsModel>> requestGoods() async {
    final result = await HttpRequest.six6dRequest("http://18sheng.71baomu.com/app/product/recommend?key=",
                                            method: 'post',
                                            params:{'type':'cheap'});
    List<HomeGoodsModel> homeGoods = [];
    for (var sub in result) {
      homeGoods.add(HomeGoodsModel.fromJson(sub));
    }
    return homeGoods;
  }

  static Future<List<BrandModel>> requestBrand() async {
    final result = await HttpRequest.six6dRequest("http://18sheng.71baomu.com/app/brand/list?key=",
                                            method: 'post');

    List<BrandModel> brands = [];
    for (var sub in result) {
      brands.add(BrandModel.fromJson(sub));
    }
    return brands;
  }
}