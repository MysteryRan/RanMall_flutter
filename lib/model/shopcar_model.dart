class ShopCarModel {
  bool checked;
  int count;
  String shopCarID;

  ShopCarModel({this.checked,this.count,this.shopCarID});

  ShopCarModel.fromJson(Map<String,dynamic>json) {
    this.checked = json["title"];
    this.count = json["forward"];
  }
}