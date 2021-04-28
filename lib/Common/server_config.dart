const serverUrl = 'http://127.0.0.1:7000/';
const serverPath = {
  'GoodsCats': serverUrl + '/v1/GoodsCats', // 顶部分类列表
  'ActionsList': serverUrl + '/v1/ActionsList', // 活动列表 
  'ActionsGoodsList': serverUrl + '/v1/ActionsGoodsList', // 指定活动所有宝贝
  'MyCartList': serverUrl + '/v1/MyCartList', // 我的购物车
  'AddCart': serverUrl + '/v1/AddCart', // 加入购物车
  'MyAddressList': serverUrl + '/v1/MyAddressList', // 用户地址列表
  'AddMyAddress': serverUrl + '/v1/AddMyAddress', //添加地址列表
  'DelOnlyCart': serverUrl + '/v1/DelOnlyCart', // 加入购物车
  'EditIsdefaultAddress': serverUrl + '/v1/EditIsdefaultAddress', // 修改默认地址
  'Submit': serverUrl + '/v1/Submit', // 修改默认地址
  'ConfirmOrder': serverUrl + '/v1/ConfirmOrder', // 修改默认地址
  'Payments': serverUrl + '/v1/Payments', // 修改默认地址Payments
  'Member': serverUrl + '/v1/Member', // 个人中心
  //
  'OrderWaitPay': serverUrl + '/v1/GetUserOrders?type=waitPay', // 个人中心
  'OrderWaitDelivery': serverUrl + '/v1/GetUserOrders?type=waitDelivery', // 个人中心
  'OrderWaitReceive': serverUrl + '/v1/GetUserOrders?type=waitReceive', // 个人中心
  'OrderWaitAppraise': serverUrl + '/v1/GetUserOrders?type=waitAppraise', // 个人中心
  'OrderFinish': serverUrl + '/v1/GetUserOrders?type=finish', // 个人中心
  'OrderAbnormal': serverUrl + '/v1/GetUserOrders?type=abnormal' // 个人中心
  //
};


int payvalue=0;
String payFrom;