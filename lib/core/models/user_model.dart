class UserModel {
  int? status;
  String? msg;
  User? data;

  UserModel({this.status, this.msg, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  String? type;
  int? typeAccount;
  String? gender;
  String? photo;
  String? fcmToken;
  String? token;
  String? tokenType;

  User(
      {this.id,
        this.name,
        this.phone,
        this.type,
        this.typeAccount,
        this.gender,
        this.photo,
        this.fcmToken,
        this.token,
        this.tokenType});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    type = json['type'];
    typeAccount = json['type_account'];
    gender = json['gender'];
    photo = json['photo'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['type'] = type;
    data['type_account'] = typeAccount;
    data['gender'] = gender;
    data['photo'] = photo;
    data['fcm_token'] = fcmToken;
    data['token'] = token;
    data['token_type'] = tokenType;
    return data;
  }
}