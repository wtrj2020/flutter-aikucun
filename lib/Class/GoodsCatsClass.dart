class GoodsCatsClass {
  int status;
  String msg;
  List<Data> data;

  GoodsCatsClass({this.status, this.msg, this.data});

  GoodsCatsClass.fromJson(Map<String, dynamic> json) {
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
  int id;
  String catName;
  int sort;
  int createTime;
  int updateTime;
  int dataFlag;

  Data(
      {this.id,
      this.catName,
      this.sort,
      this.createTime,
      this.updateTime,
      this.dataFlag});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catName = json['cat_name'];
    sort = json['sort'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
    dataFlag = json['data_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_name'] = this.catName;
    data['sort'] = this.sort;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['data_flag'] = this.dataFlag;
    return data;
  }
}