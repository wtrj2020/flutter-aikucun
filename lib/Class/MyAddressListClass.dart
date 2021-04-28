class MyAddressListClass {
  int status;
  String msg;
  List<Data> data;

  MyAddressListClass({this.status, this.msg, this.data});

  MyAddressListClass.fromJson(Map<String, dynamic> json) {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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