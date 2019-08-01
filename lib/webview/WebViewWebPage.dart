import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:splash_tokenauth/webview/KeyBoard_webView.dart';
import 'package:splash_tokenauth/webview/Navigation_controls.dart';


class WebViewWebPage extends StatefulWidget {
  final String url;
  WebViewWebPage(this.url);

  @override
  State<StatefulWidget> createState() => new _WebViewWebPage(this.url);

}

class _WebViewWebPage extends State<WebViewWebPage>{

  var _url;
  _WebViewWebPage(this._url);
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
      appBar: new AppBar(
         title: new Text ('Web Demo'),
         actions: <Widget>[
           NavigationControls(_controller.future)
         ],
       ),
       //floatingActionButton: _keyboardButton(),
       body: Builder(
         builder:(BuildContext context){
            return new WebviewScaffold(
               url: _url,

            );
           }
         ),
       );
  }
 /* _keyboardButton(){
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return FloatingActionButton(
            onPressed: () async {
              var url = await controller.data.currentUrl();

              //_favorites.add(url);
              SystemChannels.textInput.invokeMethod('TextInput.show');

            },
            child: Icon(Icons.keyboard),
          );
        }
        return Container();
      },
    );

  }*/
}

