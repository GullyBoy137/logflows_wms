import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:splash_tokenauth/common/functions/saveCurrentLogin.dart';
import 'package:splash_tokenauth/common/functions/showDialogSingleButton.dart';
import 'dart:convert';
import 'package:splash_tokenauth/model/json/loginModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_tokenauth/ui/loginScreen.dart';

String apiToken = "";
String custKey = "";
String Token = "";
String warehouseName = "";
Future<LoginModel> requestLoginAPI(BuildContext context, String username, String password) async {
  print('in requestLoginAPI');
  final url = "https://legacy-api.logflows.com/v1/auth/login";

  Map<String, String> body = {
    'username': username,
    'password': password,
  };

  final response = await http.post(
    url,
    headers: {"Accept": "application/json"},
    body: body,
  );

  if (response.statusCode == 200) {
    print('in status = 200');
    final responseJson = json.decode(response.body);
    var user = new LoginModel.fromJson(responseJson);
    //var datUser = new LoginModel.fromJson(responseJson);
    saveCurrentLogin(responseJson);
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
    print(user.data.apiToken);
    apiToken = user.data.apiToken;
    custKey = user.data.custKey;
    print(custKey);
    Token = user.data.token;
    print(responseJson);
    warehouseName = user.data.userInfo.companyName;
    //print(user.data.apiToken);

    //print('\n');
    //apiToken = responseJson['apiToken'];
    //print(apiToken);
    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);
    //apiToken = json.decode(responseJson['data'].);
    saveCurrentLogin(responseJson);
    showDialogSingleButton(context, "Unable to Login", "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.", "OK");
    return null;
  }
}

