class ActionsGoodsListClass {
  int status;
  String msg;
  List<Data> data;

  ActionsGoodsListClass({this.status, this.msg, this.data});

  ActionsGoodsListClass.fromJson(Map<String, dynamic> json) {
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
  int goodsId;
  int shopId;
  String goodsSn;
  String goodsName;
  int goodsStock;
  int cleanPrice;
  int originalPrice;
  int goodsPrice;
  int status;
  int catId;
  String goodsImg;
  String goodsImgs;
  List<String> goodsImgsArray;
  int createTime;
  int updateTime;
  int dataFlag;
  bool isEdit;
  List<GoodsSpecs> goodsSpecs;

  Data(
      {this.goodsId,
      this.shopId,
      this.goodsSn,
      this.goodsName,
      this.goodsStock,
      this.cleanPrice,
      this.originalPrice,
      this.goodsPrice,
      this.status,
      this.catId,
      this.goodsImg,
      this.goodsImgs,
      this.goodsImgsArray,
      this.createTime,
      this.updateTime,
      this.dataFlag,
      this.isEdit,
      this.goodsSpecs});

  Data.fromJson(Map<String, dynamic> json) {
    goodsId = json['goods_id'];
    shopId = json['shop_id'];
    goodsSn = json['goods_sn'];
    goodsName = json['goods_name'];
    goodsStock = json['goods_stock'];
    cleanPrice = json['clean_price'];
    originalPrice = json['original_price'];
    goodsPrice = json['goods_price'];
    status = json['status'];
    catId = json['cat_id'];
    goodsImg = json['goods_img'];
    goodsImgs = json['goods_imgs'];
    goodsImgsArray = json['goods_imgs_array'].cast<String>();
    createTime = json['create_time'];
    updateTime = json['update_time'];
    dataFlag = json['data_flag'];
    isEdit = json['is_edit'];
    if (json['goods_specs'] != null) {
      goodsSpecs = new List<GoodsSpecs>();
      json['goods_specs'].forEach((v) {
        goodsSpecs.add(new GoodsSpecs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goods_id'] = this.goodsId;
    data['shop_id'] = this.shopId;
    data['goods_sn'] = this.goodsSn;
    data['goods_name'] = this.goodsName;
    data['goods_stock'] = this.goodsStock;
    data['clean_price'] = this.cleanPrice;
    data['original_price'] = this.originalPrice;
    data['goods_price'] = this.goodsPrice;
    data['status'] = this.status;
    data['cat_id'] = this.catId;
    data['goods_img'] = this.goodsImg;
    data['goods_imgs'] = this.goodsImgs;
    data['goods_imgs_array'] = this.goodsImgsArray;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['data_flag'] = this.dataFlag;
    data['is_edit'] = this.isEdit;
    if (this.goodsSpecs != null) {
      data['goods_specs'] = this.goodsSpecs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoodsSpecs {
  int id;
  int shopId;
  String goodsSn;
  int goodsId;
  String specName;
  String specColour;
  String specOnly;
  int goodsStock;
  int cleanPrice;
  int originalPrice;
  int goodsPrice;
  int status;
  String goodsImg;
  int createTime;
  int updateTime;
  int dataFlag;
  int commission;
  int cartNum;
  int isCheck;
  int goodsSpecId;

  GoodsSpecs(
      {this.id,
      this.shopId,
      this.goodsSn,
      this.goodsId,
      this.specName,
      this.specColour,
      this.specOnly,
      this.goodsStock,
      this.cleanPrice,
      this.originalPrice,
      this.goodsPrice,
      this.status,
      this.goodsImg,
      this.createTime,
      this.updateTime,
      this.dataFlag,
      this.commission,
      this.cartNum,
      this.isCheck,
      this.goodsSpecId});

  GoodsSpecs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    goodsSn = json['goods_sn'];
    goodsId = json['goods_id'];
    specName = json['spec_name'];
    specColour = json['spec_colour'];
    specOnly = json['spec_only'];
    goodsStock = json['goods_stock'];
    cleanPrice = json['clean_price'];
    originalPrice = json['original_price'];
    goodsPrice = json['goods_price'];
    status = json['status'];
    goodsImg = json['goods_img'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
    dataFlag = json['data_flag'];
    commission = json['commission'];
    cartNum = json['cart_num'];
    isCheck = json['is_check'];
    goodsSpecId = json['goods_spec_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['goods_sn'] = this.goodsSn;
    data['goods_id'] = this.goodsId;
    data['spec_name'] = this.specName;
    data['spec_colour'] = this.specColour;
    data['spec_only'] = this.specOnly;
    data['goods_stock'] = this.goodsStock;
    data['clean_price'] = this.cleanPrice;
    data['original_price'] = this.originalPrice;
    data['goods_price'] = this.goodsPrice;
    data['status'] = this.status;
    data['goods_img'] = this.goodsImg;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['data_flag'] = this.dataFlag;
    data['commission'] = this.commission;
    data['cart_num'] = this.cartNum;
    data['is_check'] = this.isCheck;
    data['goods_spec_id'] = this.goodsSpecId;
    return data;
  }
}