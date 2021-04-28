class ActionsListClass {
  int status;
  String msg;
  List<Data> data;

  ActionsListClass({this.status, this.msg, this.data});

  ActionsListClass.fromJson(Map<String, dynamic> json) {
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
  int themeId;
  int shopId;
  int itemsId;
  String shopName;
  String themeName;
  String themeNotice;
  int catId;
  String catName;
  String actionName;
  String goodsIds;
  String goodsImgs;
  List<String> goodsImgsArray;
  int pubStatus;
  String pubName;
  int pubStart;
  int pubEnd;
  String actName;
  int actStatus;
  int actStart;
  int actEnd;
  int sort;
  int dataFlag;
  int createTime;
  int updateTime;
  int isEdit;
  int number;

  Data(
      {this.themeId,
      this.shopId,
      this.itemsId,
      this.shopName,
      this.themeName,
      this.themeNotice,
      this.catId,
      this.catName,
      this.actionName,
      this.goodsIds,
      this.goodsImgs,
      this.goodsImgsArray,
      this.pubStatus,
      this.pubName,
      this.pubStart,
      this.pubEnd,
      this.actName,
      this.actStatus,
      this.actStart,
      this.actEnd,
      this.sort,
      this.dataFlag,
      this.createTime,
      this.updateTime,
      this.isEdit,
      this.number});

  Data.fromJson(Map<String, dynamic> json) {
    themeId = json['theme_id'];
    shopId = json['shop_id'];
    itemsId = json['items_id'];
    shopName = json['shop_name'];
    themeName = json['theme_name'];
    themeNotice = json['theme_notice'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    actionName = json['action_name'];
    goodsIds = json['goods_ids'];
    goodsImgs = json['goods_imgs'];
    goodsImgsArray = json['goods_imgs_array'].cast<String>();
    pubStatus = json['pub_status'];
    pubName = json['pub_name'];
    pubStart = json['pub_start'];
    pubEnd = json['pub_end'];
    actName = json['act_name'];
    actStatus = json['act_status'];
    actStart = json['act_start'];
    actEnd = json['act_end'];
    sort = json['sort'];
    dataFlag = json['data_flag'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
    isEdit = json['is_edit'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['theme_id'] = this.themeId;
    data['shop_id'] = this.shopId;
    data['items_id'] = this.itemsId;
    data['shop_name'] = this.shopName;
    data['theme_name'] = this.themeName;
    data['theme_notice'] = this.themeNotice;
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['action_name'] = this.actionName;
    data['goods_ids'] = this.goodsIds;
    data['goods_imgs'] = this.goodsImgs;
    data['goods_imgs_array'] = this.goodsImgsArray;
    data['pub_status'] = this.pubStatus;
    data['pub_name'] = this.pubName;
    data['pub_start'] = this.pubStart;
    data['pub_end'] = this.pubEnd;
    data['act_name'] = this.actName;
    data['act_status'] = this.actStatus;
    data['act_start'] = this.actStart;
    data['act_end'] = this.actEnd;
    data['sort'] = this.sort;
    data['data_flag'] = this.dataFlag;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['is_edit'] = this.isEdit;
    data['number'] = this.number;
    return data;
  }
}