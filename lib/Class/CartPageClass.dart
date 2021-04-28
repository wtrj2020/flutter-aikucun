class CartPageClass {
  int status;
  String msg;
  List<Data> data;

  CartPageClass({this.status, this.msg, this.data});

  CartPageClass.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int shopId;
  String shopName;
  String shopCompany;
  String shopImg;
  String shopAddress;
  int shopPrice;
  int shopCleanPrice;
  int cartNum;
  UserAddress userAddress;
  List<Listx> listx;

  Data(
      {this.shopId,
      this.shopName,
      this.shopCompany,
      this.shopImg,
      this.shopAddress,
      this.shopPrice,
      this.shopCleanPrice,
      this.cartNum,
      this.userAddress,
      this.listx});

  Data.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopCompany = json['shop_company'];
    shopImg = json['shop_img'];
    shopAddress = json['shop_address'];
    shopPrice = json['shop_price'];
    shopCleanPrice = json['shop_clean_price'];
    cartNum = json['cart_num'];
    userAddress = json['user_address'] != null
        ? new UserAddress.fromJson(json['user_address'])
        : null;
    if (json['listx'] != null) {
      listx = new List<Listx>();
      json['listx'].forEach((v) {
        listx.add(new Listx.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['shop_company'] = this.shopCompany;
    data['shop_img'] = this.shopImg;
    data['shop_address'] = this.shopAddress;
    data['shop_price'] = this.shopPrice;
    data['shop_clean_price'] = this.shopCleanPrice;
    data['cart_num'] = this.cartNum;
    if (this.userAddress != null) {
      data['user_address'] = this.userAddress.toJson();
    }
    if (this.listx != null) {
      data['listx'] = this.listx.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserAddress {
  int addressId;
  int userId;
  String userName;
  String userPhone;
  String areaIdPath;
  int areaId;
  String userAddress;
  int isDefault;
  int dataFlag;
  int createTime;
  int updateTime;

  UserAddress(
      {this.addressId,
      this.userId,
      this.userName,
      this.userPhone,
      this.areaIdPath,
      this.areaId,
      this.userAddress,
      this.isDefault,
      this.dataFlag,
      this.createTime,
      this.updateTime});

  UserAddress.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    userId = json['user_id'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    areaIdPath = json['areaId_path'];
    areaId = json['area_id'];
    userAddress = json['user_address'];
    isDefault = json['is_default'];
    dataFlag = json['data_flag'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_phone'] = this.userPhone;
    data['areaId_path'] = this.areaIdPath;
    data['area_id'] = this.areaId;
    data['user_address'] = this.userAddress;
    data['is_default'] = this.isDefault;
    data['data_flag'] = this.dataFlag;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    return data;
  }
}

class Listx {
  int shopId;
  int cartId;
  int goodsSpecId;
  int isCheck;
  int cartNum;
  int goodsId;
  String goodsName;
  String goodsImg;
  String specName;
  String goodsSn;
  String specColour;
  String specOnly;
  int goodsStock;
  int goodsPrice;
  int cleanPrice;
  String shopName;
  int commission;

  Listx(
      {this.shopId,
      this.cartId,
      this.goodsSpecId,
      this.isCheck,
      this.cartNum,
      this.goodsId,
      this.goodsName,
      this.goodsImg,
      this.specName,
      this.goodsSn,
      this.specColour,
      this.specOnly,
      this.goodsStock,
      this.goodsPrice,
      this.cleanPrice,
      this.shopName,
      this.commission});

  Listx.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    cartId = json['cart_id'];
    goodsSpecId = json['goods_spec_id'];
    isCheck = json['is_check'];
    cartNum = json['cart_num'];
    goodsId = json['goods_id'];
    goodsName = json['goods_name'];
    goodsImg = json['goods_img'];
    specName = json['spec_name'];
    goodsSn = json['goods_sn'];
    specColour = json['spec_colour'];
    specOnly = json['spec_only'];
    goodsStock = json['goods_stock'];
    goodsPrice = json['goods_price'];
    cleanPrice = json['clean_price'];
    shopName = json['shop_name'];
    commission = json['commission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = this.shopId;
    data['cart_id'] = this.cartId;
    data['goods_spec_id'] = this.goodsSpecId;
    data['is_check'] = this.isCheck;
    data['cart_num'] = this.cartNum;
    data['goods_id'] = this.goodsId;
    data['goods_name'] = this.goodsName;
    data['goods_img'] = this.goodsImg;
    data['spec_name'] = this.specName;
    data['goods_sn'] = this.goodsSn;
    data['spec_colour'] = this.specColour;
    data['spec_only'] = this.specOnly;
    data['goods_stock'] = this.goodsStock;
    data['goods_price'] = this.goodsPrice;
    data['clean_price'] = this.cleanPrice;
    data['shop_name'] = this.shopName;
    data['commission'] = this.commission;
    return data;
  }
}