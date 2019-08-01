import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart';
import 'package:splash_tokenauth/webview/Navigation_controls.dart';

class WebViewDemo extends StatefulWidget{

  final String url;

 // WebViewDemo({Key key, this.url}) : super(key:key);
  WebViewDemo(this.url);
  //String getUrl(){ return url;}

  @override
  State<StatefulWidget> createState() => new _WebViewDemoState(this.url);
}


class _WebViewDemoState extends State<WebViewDemo>{
  //WebViewDemo demo;
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  //String l = demo.getUrl();
  String _url;
  _WebViewDemoState(this._url);
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Webview Demo'),
        actions: <Widget>[
          NavigationControls(_controller.future)
        ],
      ),
      //floatingActionButton: _keyboardButton(),
      body: Builder(
          builder:(BuildContext context){
            SystemChannels.textInput.invokeMethod('TextInput.hide');
            return WebviewScaffold(
              url: _url,

              //javascriptMode: JavascriptMode.unrestricted,
              /*onWebViewCreated: (WebViewController webViewController){
               _controller.complete(webViewController);
              },*/

            );
        }
      )
    );
  }

  /*_keyboardButton(){
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
           // SystemChannels.textInput.invokeMethod('TextInput.show');
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


