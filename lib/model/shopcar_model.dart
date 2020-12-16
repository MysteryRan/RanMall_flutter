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


class StyleModel {
  bool checked;
  int count;
  String styleName;

  StyleModel({this.checked,this.count,this.styleName});

  StyleModel.fromJson(Map<String,dynamic>json) {
    this.checked = json["title"];
    this.count = json["forward"];
  }
}

enum MessageType {
  send,
  receive,
}

enum MediaType {
  text,
  image,
  audio,
  video,

}

class ChatMessageModel {
  MessageType messageType;
  MediaType mediaType;
  String content;

  ChatMessageModel({this.messageType,this.mediaType,this.content});

  ChatMessageModel.fromJson(Map<String,dynamic>json) {
    this.messageType = json["title"];
    this.mediaType = json["forward"];
    this.content = json["forward"];
  }
}

class AddressModel {
  String name;
  String phone;
  String address;
  String detail;

  AddressModel({this.name,this.phone,this.address,this.detail});

  AddressModel.fromJson(Map<String,dynamic>json) {
    this.name = json["title"];
    this.phone = json["forward"];
    this.address = json["forward"];
    this.detail = json["forward"];
  }
}