import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart';


class NavigationControls extends StatelessWidget{
  const NavigationControls(this._webViewControllerFuture);
  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _webViewControllerFuture,
        builder: (BuildContext context, AsyncSnapshot<WebViewController> snapshot){
          final bool webViewReady = snapshot.connectionState == ConnectionState.done;
          final WebViewController controller = snapshot.data;

          return Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: !webViewReady? null:() async {
                  if (await controller.canGoBack()){
                    controller.goBack();
                  }else{
                    Scaffold.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No Back history Item"),
                      ),
                    );
                  }
                },
              ),

              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: !webViewReady? null:() async {
                  if (await controller.canGoForward()){
                    controller.goForward();
                  }else{
                    Scaffold.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No Forward history Item"),
                      ),
                    );
                  }
                },
              ),
            ],
          );
        }
    );
  }
}