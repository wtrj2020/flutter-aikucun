class ConfirmOrderClass {
  int status;
  String msg;
  Data data;

  ConfirmOrderClass({this.status, this.msg, this.data});

  ConfirmOrderClass.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int orderId;
  String orderNo;
  int shopId;
  int userId;
  int orderStatus;
  int goodsMoney;
  int totalMoney;
  int cleanPrice;
  int payType;
  String payFrom;
  int isPay;
  int areaId;
  String areaIdPath;
  String userName;
  String userAddress;
  String userPhone;
  int orderScore;
  String orderRemarks;
  String orderSrc;
  String orderunique;
  int expressId;
  String expressNo;
  int dataFlag;
  int noticeDeliver;
  int totalCommission;
  int addressId;
  Null orderGoods;
  int payTime;
  int deliveryTime;
  int receiveTime;
  int createTime;
  int updateTime;
  List<Payments> payments;

  Data(
      {this.orderId,
      this.orderNo,
      this.shopId,
      this.userId,
      this.orderStatus,
      this.goodsMoney,
      this.totalMoney,
      this.cleanPrice,
      this.payType,
      this.payFrom,
      this.isPay,
      this.areaId,
      this.areaIdPath,
      this.userName,
      this.userAddress,
      this.userPhone,
      this.orderScore,
      this.orderRemarks,
      this.orderSrc,
      this.orderunique,
      this.expressId,
      this.expressNo,
      this.dataFlag,
      this.noticeDeliver,
      this.totalCommission,
      this.addressId,
      this.orderGoods,
      this.payTime,
      this.deliveryTime,
      this.receiveTime,
      this.createTime,
      this.updateTime,
      this.payments});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderNo = json['order_no'];
    shopId = json['shop_id'];
    userId = json['user_id'];
    orderStatus = json['order_status'];
    goodsMoney = json['goods_money'];
    totalMoney = json['total_money'];
    cleanPrice = json['clean_price'];
    payType = json['pay_type'];
    payFrom = json['pay_from'];
    isPay = json['is_pay'];
    areaId = json['area_id'];
    areaIdPath = json['area_id_path'];
    userName = json['user_name'];
    userAddress = json['user_address'];
    userPhone = json['user_phone'];
    orderScore = json['order_score'];
    orderRemarks = json['order_remarks'];
    orderSrc = json['order_src'];
    orderunique = json['orderunique'];
    expressId = json['express_id'];
    expressNo = json['express_no'];
    dataFlag = json['data_flag'];
    noticeDeliver = json['notice_deliver'];
    totalCommission = json['total_commission'];
    addressId = json['address_id'];
    orderGoods = json['Order_goods'];
    payTime = json['pay_time'];
    deliveryTime = json['delivery_time'];
    receiveTime = json['receive_time'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
    if (json['payments'] != null) {
      payments = new List<Payments>();
      json['payments'].forEach((v) {
        payments.add(new Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_no'] = this.orderNo;
    data['shop_id'] = this.shopId;
    data['user_id'] = this.userId;
    data['order_status'] = this.orderStatus;
    data['goods_money'] = this.goodsMoney;
    data['total_money'] = this.totalMoney;
    data['clean_price'] = this.cleanPrice;
    data['pay_type'] = this.payType;
    data['pay_from'] = this.payFrom;
    data['is_pay'] = this.isPay;
    data['area_id'] = this.areaId;
    data['area_id_path'] = this.areaIdPath;
    data['user_name'] = this.userName;
    data['user_address'] = this.userAddress;
    data['user_phone'] = this.userPhone;
    data['order_score'] = this.orderScore;
    data['order_remarks'] = this.orderRemarks;
    data['order_src'] = this.orderSrc;
    data['orderunique'] = this.orderunique;
    data['express_id'] = this.expressId;
    data['express_no'] = this.expressNo;
    data['data_flag'] = this.dataFlag;
    data['notice_deliver'] = this.noticeDeliver;
    data['total_commission'] = this.totalCommission;
    data['address_id'] = this.addressId;
    data['Order_goods'] = this.orderGoods;
    data['pay_time'] = this.payTime;
    data['delivery_time'] = this.deliveryTime;
    data['receive_time'] = this.receiveTime;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    if (this.payments != null) {
      data['payments'] = this.payments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payments {
  int id;
  String orderNo;
  String payFrom;
  String payName;
  int payOrder;
  String payConfig;
  int enabled;
  int userId;

  Payments(
      {this.id,
      this.orderNo,
      this.payFrom,
      this.payName,
      this.payOrder,
      this.payConfig,
      this.enabled,
      this.userId});

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    payFrom = json['pay_from'];
    payName = json['pay_name'];
    payOrder = json['pay_order'];
    payConfig = json['pay_config'];
    enabled = json['enabled'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_no'] = this.orderNo;
    data['pay_from'] = this.payFrom;
    data['pay_name'] = this.payName;
    data['pay_order'] = this.payOrder;
    data['pay_config'] = this.payConfig;
    data['enabled'] = this.enabled;
    data['user_id'] = this.userId;
    return data;
  }
}