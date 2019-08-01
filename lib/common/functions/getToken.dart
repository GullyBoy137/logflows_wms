

import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_tokenauth/common/apifunctions/requestLoginAPI.dart';
getToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  String getToken = await preferences.getString("LastToken");
 // String getToken = await preferences.get(key)
 // print('hey');
 // String getToken = Token;
  return getToken;
}

/*getcustKey() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  String getCK = await preferences.getString("custKey");
  print('hello');
  return getCK;
}*/