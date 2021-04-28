class GetUserOrdersClass {
  int status;
  String msg;
  List<Data> data;

  GetUserOrdersClass({this.status, this.msg, this.data});

  GetUserOrdersClass.fromJson(Map<String, dynamic> json) {
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
  int orderStatus;
  List<Payments> payments;
  int totalMoney;
  String goodsImg;
  String orderunique;
  int areaId;
  String userName;
  String userAddress;
  String userPhone;
  int payTime;
  int createTime;
  List<ShopsOrder> shopsOrder;
  Null orders;

  Data(
      {this.orderStatus,
      this.payments,
      this.totalMoney,
      this.goodsImg,
      this.orderunique,
      this.areaId,
      this.userName,
      this.userAddress,
      this.userPhone,
      this.payTime,
      this.createTime,
      this.shopsOrder,
      this.orders});

  Data.fromJson(Map<String, dynamic> json) {
    orderStatus = json['order_status'];
    if (json['payments'] != null) {
      payments = new List<Payments>();
      json['payments'].forEach((v) {
        payments.add(new Payments.fromJson(v));
      });
    }
    totalMoney = json['total_money'];
    goodsImg = json['goods_img'];
    orderunique = json['orderunique'];
    areaId = json['area_id'];
    userName = json['user_name'];
    userAddress = json['user_address'];
    userPhone = json['user_phone'];
    payTime = json['pay_time'];
    createTime = json['create_time'];
    if (json['shops_order'] != null) {
      shopsOrder = new List<ShopsOrder>();
      json['shops_order'].forEach((v) {
        shopsOrder.add(new ShopsOrder.fromJson(v));
      });
    }
    orders = json['orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_status'] = this.orderStatus;
    if (this.payments != null) {
      data['payments'] = this.payments.map((v) => v.toJson()).toList();
    }
    data['total_money'] = this.totalMoney;
    data['goods_img'] = this.goodsImg;
    data['orderunique'] = this.orderunique;
    data['area_id'] = this.areaId;
    data['user_name'] = this.userName;
    data['user_address'] = this.userAddress;
    data['user_phone'] = this.userPhone;
    data['pay_time'] = this.payTime;
    data['create_time'] = this.createTime;
    if (this.shopsOrder != null) {
      data['shops_order'] = this.shopsOrder.map((v) => v.toJson()).toList();
    }
    data['orders'] = this.orders;
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

class ShopsOrder {
  int shopId;
  String shopName;
  String shopCompany;
  String shopImg;
  String shopAddress;
  int shopPrice;
  int shopCleanPrice;
  int cartNum;
  UserAddress userAddress;
  Null listx;
  List<Orders> orders;

  ShopsOrder(
      {this.shopId,
      this.shopName,
      this.shopCompany,
      this.shopImg,
      this.shopAddress,
      this.shopPrice,
      this.shopCleanPrice,
      this.cartNum,
      this.userAddress,
      this.listx,
      this.orders});

  ShopsOrder.fromJson(Map<String, dynamic> json) {
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
    listx = json['listx'];
    if (json['orders'] != null) {
      orders = new List<Orders>();
      json['orders'].forEach((v) {
        orders.add(new Orders.fromJson(v));
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
    data['listx'] = this.listx;
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
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

class Orders {
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
  List<OrderGoods> orderGoods;
  int payTime;
  int deliveryTime;
  int receiveTime;
  int createTime;
  int updateTime;
  Null payments;

  Orders(
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

  Orders.fromJson(Map<String, dynamic> json) {
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
    if (json['Order_goods'] != null) {
      orderGoods = new List<OrderGoods>();
      json['Order_goods'].forEach((v) {
        orderGoods.add(new OrderGoods.fromJson(v));
      });
    }
    payTime = json['pay_time'];
    deliveryTime = json['delivery_time'];
    receiveTime = json['receive_time'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
    payments = json['payments'];
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
    if (this.orderGoods != null) {
      data['Order_goods'] = this.orderGoods.map((v) => v.toJson()).toList();
    }
    data['pay_time'] = this.payTime;
    data['delivery_time'] = this.deliveryTime;
    data['receive_time'] = this.receiveTime;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['payments'] = this.payments;
    return data;
  }
}

class OrderGoods {
  int id;
  int orderId;
  int goodsId;
  int goodsNum;
  int goodsPrice;
  int cleanPrice;
  int goodsSpecId;
  String goodsSpecNames;
  String goodsName;
  String goodsImg;
  String goodsSn;
  int commission;
  int dataFlag;
  int createTime;
  int updateTime;

  OrderGoods(
      {this.id,
      this.orderId,
      this.goodsId,
      this.goodsNum,
      this.goodsPrice,
      this.cleanPrice,
      this.goodsSpecId,
      this.goodsSpecNames,
      this.goodsName,
      this.goodsImg,
      this.goodsSn,
      this.commission,
      this.dataFlag,
      this.createTime,
      this.updateTime});

  OrderGoods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    goodsId = json['goods_id'];
    goodsNum = json['goods_num'];
    goodsPrice = json['goods_price'];
    cleanPrice = json['clean_price'];
    goodsSpecId = json['goods_spec_id'];
    goodsSpecNames = json['goods_spec_names'];
    goodsName = json['goods_name'];
    goodsImg = json['goods_img'];
    goodsSn = json['goods_sn'];
    commission = json['commission'];
    dataFlag = json['data_flag'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['goods_id'] = this.goodsId;
    data['goods_num'] = this.goodsNum;
    data['goods_price'] = this.goodsPrice;
    data['clean_price'] = this.cleanPrice;
    data['goods_spec_id'] = this.goodsSpecId;
    data['goods_spec_names'] = this.goodsSpecNames;
    data['goods_name'] = this.goodsName;
    data['goods_img'] = this.goodsImg;
    data['goods_sn'] = this.goodsSn;
    data['commission'] = this.commission;
    data['data_flag'] = this.dataFlag;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    return data;
  }
}