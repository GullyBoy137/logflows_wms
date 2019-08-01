class LoginModel {
  final String userName;
  final String token;
  final String email;
  final int userId;
  DataProp data;

  LoginModel(this.userName, this.token, this.email, this.userId, this.data);


 /* factory LoginModel.fromJson(Map<String, dynamic> parsedJson){
    return LoginModel(
         data: parsedJson['data'],
         userName : parsedJson['name'],
         token : parsedJson['token'],
         email : parsedJson['email'],
         userId : parsedJson['pk']
    );
  }*/

  /* factory LoginModel.fromJson(Map<String, dynamic> parsedJson){
    return LoginModel(
        studentId: parsedJson['id'],
        studentName : parsedJson['name'],
        studentScores : parsedJson ['score']
    );
  */
  LoginModel.fromJson(Map<String, dynamic> json)
      : userName = json['name'],
        token = json['token'],
        email = json['email'],
        userId = json['pk'],
        data = DataProp.fromJson(json['data']);


  Map<String, dynamic> toJson() =>
      {
        'name': userName,
        'token': token,
        'email': email,
        'pk': userId,
        'data': data,
      };

}

class DataProp{

  final String token;
  final String custKey;
  final String apiToken;
  UserInfo userInfo;

  DataProp(this.token, this.custKey, this.apiToken, this.userInfo);

  /*factory DataProp.fromJson(Map<String, dynamic> json){
    return DataProp(
        token: json['token'],
        custKey: json['custKey'],
        apiToken: json['apiToken']
    );
  }
  String getCustKey(){
    return custKey;
  }

  String getApiToken(){
    return apiToken;
  }*/

  DataProp.fromJson(Map<String, dynamic> json)
      :
        token = json['token'],
        custKey = json['custKey'],
        apiToken = json['apiToken'],
        userInfo = UserInfo.fromJson(json['user']);


  Map<String, dynamic> toJson() =>
      {

        'token': token,
        'custKey': custKey,
        'apiToken': apiToken,

      };

}

class UserInfo{

  final String id;
  final String name;
  final String companyName;

  UserInfo(this.id, this.name, this.companyName);

  UserInfo.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        name = json['name'],
        companyName = json['warehouseCompanyName'];

  Map<String, dynamic> toJson() =>
      {

        'id': id,
        'name': name,
        'companyName': companyName,
      };

}