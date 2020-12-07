class CategoryModel {
  final String url;
  final String name;
  final int shop_category_id;

  CategoryModel({this.url,this.name,this.shop_category_id});

  factory CategoryModel.fromJson(Map<String,dynamic>json) {
    return CategoryModel(url: json["url"],
                        name: json["name"],
                        shop_category_id: json["shop_category_id"]);
  }
}


class HomeGoodsModel {
  final String product_name;
  final String image_url;
  final String sales_volume;
  final String spec_price_yuan;
  final String vip_price_yuan;

  HomeGoodsModel({this.product_name,this.image_url,this.sales_volume,this.spec_price_yuan,this.vip_price_yuan});

  factory HomeGoodsModel.fromJson(Map<String,dynamic>json) {
    return HomeGoodsModel(product_name: json["product_name"],
                        image_url: json["image_url"],
                        sales_volume: json["sales_volume"],
                        spec_price_yuan: json["spec_price_yuan"].toString(),
                        vip_price_yuan: json["vip_price_yuan"].toString());
  }
}

class BrandModel {
  final String image_url;
  final String brand_name;

  BrandModel({this.image_url,this.brand_name});

  factory BrandModel.fromJson(Map<String,dynamic>json) {
    return BrandModel(brand_name: json["brand_name"],
                        image_url: json["image_url"]);
  }
}