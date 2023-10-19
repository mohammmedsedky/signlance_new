class AuthModel {
  String? name;
  String? avatar;
  String? avatarPath;
  String? userName;
  String? emailAddress;
  String? phoneNumber;
  String? accessToken;
  String? emailConfirmationCode;
  String? error;
  int? cartCount;

  // userId for forgetPassword
  int? userId;
  bool? fromForgotPassword;

  AuthModel(
      {this.name,
      this.avatar,
      this.avatarPath,
      this.userName,
      this.emailAddress,
      this.phoneNumber,
      this.accessToken,
      this.emailConfirmationCode,
      this.error,
      this.cartCount,
        this.userId,
        this.fromForgotPassword
      });

  AuthModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
    avatarPath = json['avatarPath'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
    accessToken = json['accessToken'];
    emailConfirmationCode = json['emailConfirmationCode'];
    error = json['error'];
    cartCount = json['cartCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['avatar'] = avatar;
    data['avatarPath'] = avatarPath;
    data['userName'] = userName;
    data['emailAddress'] = emailAddress;
    data['phoneNumber'] = phoneNumber;
    data['accessToken'] = accessToken;
    data['emailConfirmationCode'] = emailConfirmationCode;
    data['error'] = error;
    data['cartCount'] = cartCount;
    return data;
  }
}
