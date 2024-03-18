class LoginData {
  bool? status;
  int? statusCode;
  List<Result>? result;

  LoginData({this.status, this.statusCode, this.result});

  LoginData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? msg;
  int? srNo;
  String? userId;
  String? password;
  Null? roleId;
  String? tokenId;
  String? loginStartTime;
  bool? isActive;
  String? appType;
  String? createdBy;
  String? createdDate;
  Null? updateBy;
  Null? updatedDate;

  Result(
      {this.msg,
        this.srNo,
        this.userId,
        this.password,
        this.roleId,
        this.tokenId,
        this.loginStartTime,
        this.isActive,
        this.appType,
        this.createdBy,
        this.createdDate,
        this.updateBy,
        this.updatedDate});

  Result.fromJson(Map<String, dynamic> json) {
    msg = json['Msg'];
    srNo = json['SrNo'];
    userId = json['user_id'];
    password = json['password'];
    roleId = json['role_id'];
    tokenId = json['token_id'];
    loginStartTime = json['login_start_time'];
    isActive = json['is_active'];
    appType = json['app_type'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    updateBy = json['update_by'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Msg'] = this.msg;
    data['SrNo'] = this.srNo;
    data['user_id'] = this.userId;
    data['password'] = this.password;
    data['role_id'] = this.roleId;
    data['token_id'] = this.tokenId;
    data['login_start_time'] = this.loginStartTime;
    data['is_active'] = this.isActive;
    data['app_type'] = this.appType;
    data['created_by'] = this.createdBy;
    data['created_date'] = this.createdDate;
    data['update_by'] = this.updateBy;
    data['updated_date'] = this.updatedDate;
    return data;
  }
}