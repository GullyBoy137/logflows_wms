import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_tokenauth/common/platform/platformScaffold.dart';
import 'package:splash_tokenauth/common/widgets/basicDrawer.dart';
import 'package:splash_tokenauth/webview/webview_class.dart';
//import 'open_webpage.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:splash_tokenauth/webview/KeyBoard_webView.dart';
import 'package:splash_tokenauth/webview/WebViewWebPage.dart';
import 'package:splash_tokenauth/common/apifunctions/requestLoginAPI.dart';
import 'package:splash_tokenauth/ui/loginScreen.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() =>  _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    _saveLoginState();
    _saveCurrentRoute("/HomeScreen");
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  Future<void> _saveLoginState() async{

    setState(() {
      state = loginState.LOGGED_IN;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.bookmark)),
                Tab(icon: Icon(Icons.keyboard)),
              ],
            ),
            title: Text(warehouseName),
          ),
          drawer: BasicDrawer(),
          body: TabBarView(

              children: [
                  Container(
                    color: Colors.grey,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
                          color: Colors.orange,
                         /* decoration: new BoxDecoration(
                            border: new Border.all(color: Colors.orange),
                          ),*/
                          child: new Text(
                              "Outbound Workflows",
                            style: TextStyle(fontSize: 15.0),
                            )
                          ),
                        Container(

                          decoration: new BoxDecoration(
                              color: Colors.white,
                            border: Border(
                              right: BorderSide( color: Colors.orange),
                              left: BorderSide(color: Colors.orange)
                            )
                          ),
                            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                ButtonTheme(
                                 minWidth: 150.0,
                                 child: RaisedButton(
                                  //padding: EdgeInsets.all(20.0),
                                  child: Text('Consolidation In'),
                                  color: Colors.orange,
                                  elevation: 4.0,
                                  splashColor: Colors.blueGrey,
                                  onPressed: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute<Null>(builder: (BuildContext context) {
                                          //FocusScope.of(context).requestFocus(new FocusNode());
                                          return new WebViewDemo('http://dev-warehouse.logflows.com/#/groupactions/in?token=' + apiToken + '&key=' + custKey);

                                        }));
                                  },
                                ),
                              ),
                                ButtonTheme(
                                minWidth: 150.0,
                                child: RaisedButton(
                                  //padding: EdgeInsets.all(20.0),
                                  child: Text('Consolidation Out'),
                                  color: Colors.orange,
                                  elevation: 4.0,
                                  splashColor: Colors.blueGrey,
                                  onPressed: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute<Null>(builder: (BuildContext context) {
                                          //FocusScope.of(context).requestFocus(new FocusNode());
                                          return new WebViewDemo('http://dev-warehouse.logflows.com/#/groupactions/out?token=' + apiToken + '&key=' + custKey);

                                        }));
                                  },
                                ),
                                )
                              ],
                            ),

                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                            color: Colors.green,
                           /* decoration: new BoxDecoration(
                              border: new Border.all(color: Colors.green),
                            ),*/
                            child: new Text("Inbound Workflows",
                              style: TextStyle(fontSize: 15.0),)
                        ),
                        Container(

                            decoration: new BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    right: BorderSide( color: Colors.green),
                                    left: BorderSide(color: Colors.green)
                                )
                            ),
                          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                ButtonTheme(
                                minWidth: 150.0,
                                child:RaisedButton(
                                  //padding: EdgeInsets.all(20.0),
                                  child: Text('Cargo In'),
                                  color: Colors.green,
                                  elevation: 4.0,
                                  splashColor: Colors.blueGrey,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute<Null>(builder: (BuildContext context) {
                                          //FocusScope.of(context).requestFocus(new FocusNode());
                                          return new WebViewDemo('http://dev-warehouse.logflows.com/#/cargo/in?token=' + apiToken + '&key=' + custKey);

                                        }));
                                  },
                                ),
                               ),
                                ButtonTheme(
                                minWidth: 150.0,
                                child: RaisedButton(
                                  //padding: EdgeInsets.all(20.0),
                                  child: Text('Cargo Out'),
                                  color: Colors.green,
                                  elevation: 4.0,
                                  splashColor: Colors.blueGrey,
                                  onPressed: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute<Null>(builder: (BuildContext context) {
                                          //FocusScope.of(context).requestFocus(new FocusNode());
                                          return new WebViewDemo('http://dev-warehouse.logflows.com/#/cargo/out?token=' + apiToken + '&key=' + custKey);

                                        }));
                                  },
                                ),
                               )
                              ]
                        )
                        ),
                        Container(

                            padding: EdgeInsets.fromLTRB(102, 10, 102, 10),
                            color: Colors.blue,
                           /* decoration: new BoxDecoration(
                              border: new Border.all(color: Colors.blue),
                            ),*/
                            child: new Text("Search",
                              style: TextStyle(fontSize: 15.0),)
                        ),
                        Container(

                            decoration: new BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    right: BorderSide( color: Colors.blue),
                                    left: BorderSide(color: Colors.blue),
                                    bottom: BorderSide(color: Colors.blue)
                                )
                            ),
                          padding: EdgeInsets.fromLTRB(37, 10, 37, 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                ButtonTheme(
                                  minWidth: 150.0,
                                  child:
                                  RaisedButton(
                                  //padding: EdgeInsets.all(20.0),
                                  child: Text('Ship Ref Consolidation',
                                    //style: TextStyle(fontSize: 15.0),
                                  ),
                                  color: Colors.blue,
                                  elevation: 4.0,
                                  splashColor: Colors.blueGrey,
                                  onPressed: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute<Null>(builder: (BuildContext context) {
                                          //FocusScope.of(context).requestFocus(new FocusNode());
                                          return new WebViewDemo('http://dev-warehouse.logflows.com/#/report/checking?token=' + apiToken + '&key=' + custKey);

                                        }));
                                  },
                                 )
                                )

                              ]

                        )
                        )
                      ],
                    ),
                  ),
                 Container(

                   color: Colors.grey,
                   padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: <Widget>[
                       Container(
                           padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
                           color: Colors.orange,
                           /* decoration: new BoxDecoration(
                            border: new Border.all(color: Colors.orange),
                          ),*/
                           child: new Text(
                             "Outbound Workflows",
                             style: TextStyle(fontSize: 15.0),
                           )
                       ),
                       Container(

                         decoration: new BoxDecoration(
                             color: Colors.white,
                             border: Border(
                                 right: BorderSide( color: Colors.orange),
                                 left: BorderSide(color: Colors.orange)
                             )
                         ),
                         padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget>[
                             ButtonTheme(
                               minWidth: 150.0,
                               child: RaisedButton(
                                 //padding: EdgeInsets.all(20.0),
                                 child: Text('Consolidation In'),
                                 color: Colors.orange,
                                 elevation: 4.0,
                                 splashColor: Colors.blueGrey,
                                 onPressed: (){
                                   Navigator.of(context).push(
                                       MaterialPageRoute<Null>(builder: (BuildContext context) {
                                         //FocusScope.of(context).requestFocus(new FocusNode());
                                         return new WebViewWebPage('http://dev-warehouse.logflows.com/#/groupactions/in?token=' + apiToken + '&key=' + custKey);

                                       }));
                                 },
                               ),
                             ),
                             ButtonTheme(
                               minWidth: 150.0,
                               child: RaisedButton(
                                 //padding: EdgeInsets.all(20.0),
                                 child: Text('Consolidation Out'),
                                 color: Colors.orange,
                                 elevation: 4.0,
                                 splashColor: Colors.blueGrey,
                                 onPressed: (){
                                   Navigator.of(context).push(
                                       MaterialPageRoute<Null>(builder: (BuildContext context) {
                                         //FocusScope.of(context).requestFocus(new FocusNode());
                                         return new WebViewWebPage('http://dev-warehouse.logflows.com/#/groupactions/out?token=' + apiToken + '&key=' + custKey);

                                       }));
                                 },
                               ),
                             )
                           ],
                         ),

                       ),
                       Container(
                           padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                           color: Colors.green,
                           /* decoration: new BoxDecoration(
                              border: new Border.all(color: Colors.green),
                            ),*/
                           child: new Text("Inbound Workflows",
                             style: TextStyle(fontSize: 15.0),)
                       ),
                       Container(

                           decoration: new BoxDecoration(
                               color: Colors.white,
                               border: Border(
                                   right: BorderSide( color: Colors.green),
                                   left: BorderSide(color: Colors.green)
                               )
                           ),
                           padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                           child: Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: <Widget>[
                                 ButtonTheme(
                                   minWidth: 150.0,
                                   child:RaisedButton(
                                     //padding: EdgeInsets.all(20.0),
                                     child: Text('Cargo In'),
                                     color: Colors.green,
                                     elevation: 4.0,
                                     splashColor: Colors.blueGrey,
                                     onPressed: () {
                                       Navigator.of(context).push(
                                           MaterialPageRoute<Null>(builder: (BuildContext context) {
                                             //FocusScope.of(context).requestFocus(new FocusNode());
                                             return new WebViewWebPage('http://dev-warehouse.logflows.com/#/cargo/in?token=' + apiToken + '&key=' + custKey);

                                           }));
                                     },
                                   ),
                                 ),
                                 ButtonTheme(
                                   minWidth: 150.0,
                                   child: RaisedButton(
                                     //padding: EdgeInsets.all(20.0),
                                     child: Text('Cargo Out'),
                                     color: Colors.green,
                                     elevation: 4.0,
                                     splashColor: Colors.blueGrey,
                                     onPressed: (){
                                       Navigator.of(context).push(
                                           MaterialPageRoute<Null>(builder: (BuildContext context) {
                                             //FocusScope.of(context).requestFocus(new FocusNode());
                                             return new WebViewWebPage('http://dev-warehouse.logflows.com/#/cargo/out?token=' + apiToken + '&key=' + custKey);

                                           }));
                                     },
                                   ),
                                 )
                               ]
                           )
                       ),
                       Container(

                           padding: EdgeInsets.fromLTRB(102, 10, 102, 10),
                           color: Colors.blue,
                           /* decoration: new BoxDecoration(
                              border: new Border.all(color: Colors.blue),
                            ),*/
                           child: new Text("Search",
                             style: TextStyle(fontSize: 15.0),)
                       ),
                       Container(

                           decoration: new BoxDecoration(
                               color: Colors.white,
                               border: Border(
                                   right: BorderSide( color: Colors.blue),
                                   left: BorderSide(color: Colors.blue),
                                   bottom: BorderSide(color: Colors.blue)
                               )
                           ),
                           padding: EdgeInsets.fromLTRB(37, 10, 37, 10),
                           child: Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: <Widget>[
                                 ButtonTheme(
                                     minWidth: 150.0,
                                     child:
                                     RaisedButton(
                                       //padding: EdgeInsets.all(20.0),
                                       child: Text('Ship Ref Consolidation'),
                                       color: Colors.blue,
                                       elevation: 4.0,
                                       splashColor: Colors.blueGrey,
                                       onPressed: (){
                                         Navigator.of(context).push(
                                             MaterialPageRoute<Null>(builder: (BuildContext context) {
                                               //FocusScope.of(context).requestFocus(new FocusNode());
                                               return new WebViewWebPage('http://dev-warehouse.logflows.com/#/report/checking?token=' + apiToken + '&key=' + custKey);

                                             }));
                                       },
                                     )
                                 )

                               ]

                           )
                       )
                     ],
                   ),
                 ),
              ]
          ),
        ),
    );
  }
}
              /*  Container(
                  padding: EdgeInsets.fromLTRB(20.0, 90.0, 20.0, 70.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      RaisedButton(
                        //padding: EdgeInsets.all(20.0),
                        child: Text('Cargo In'),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute<Null>(builder: (BuildContext context) {
                                //FocusScope.of(context).requestFocus(new FocusNode());
                                return new WebViewDemo('http://dev-warehouse.logflows.com/#/cargo/in?token=' + apiToken + '&key=' + custKey);

                              }));
                        },
                      ),
                      RaisedButton(
                        //padding: EdgeInsets.all(20.0),
                        child: Text('Cargo Out'),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute<Null>(builder: (BuildContext context) {
                                //FocusScope.of(context).requestFocus(new FocusNode());
                                return new WebViewDemo('http://dev-warehouse.logflows.com/#/cargo/out?token=' + apiToken + '&key=' + custKey);

                              }));
                        },
                      ),
                      RaisedButton(
                        //padding: EdgeInsets.all(20.0),
                        child: Text('Consolidation Detail'),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute<Null>(builder: (BuildContext context) {
                                //FocusScope.of(context).requestFocus(new FocusNode());
                                return new WebViewDemo('http://dev-warehouse.logflows.com/#/groupactions/form?token=' + apiToken + '&key=' + custKey);

                              }));
                        },
                      ),
                      RaisedButton(
                        //padding: EdgeInsets.all(20.0),
                        child: Text('Consolidation In'),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute<Null>(builder: (BuildContext context) {
                                //FocusScope.of(context).requestFocus(new FocusNode());
                                return new WebViewDemo('http://dev-warehouse.logflows.com/#/groupactions/in?token=' + apiToken + '&key=' + custKey);

                              }));
                        },
                      ),
                      RaisedButton(
                        //padding: EdgeInsets.all(20.0),
                        child: Text('Consolidation Out'),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute<Null>(builder: (BuildContext context) {
                                //FocusScope.of(context).requestFocus(new FocusNode());
                                return new WebViewDemo('http://dev-warehouse.logflows.com/#/groupactions/out?token=' + apiToken + '&key=' + custKey);

                              }));
                        },
                      ),
                      RaisedButton(
                        //padding: EdgeInsets.all(20.0),
                        child: Text('Ship Ref Consolidation'),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute<Null>(builder: (BuildContext context) {
                                //FocusScope.of(context).requestFocus(new FocusNode());
                                return new WebViewDemo('http://dev-warehouse.logflows.com/#/report/checking?token=' + apiToken + '&key=' + custKey);

                              }));
                        },
                      ),

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 90.0, 20.0, 70.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Cargo In'),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute<Null>(builder: (BuildContext context) {
                                //FocusScope.of(context).requestFocus(new FocusNode());
                                return new WebViewWebPage('http://dev-warehouse.logflows.com/#/cargo/in?token=' + apiToken + '&key=' + custKey);

                              }));
                        },
                      ),
                      RaisedButton(
                        child: Text('Cargo Out'),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute<Null>(builder: (BuildContext context) {
                                //FocusScope.of(context).requestFocus(new FocusNode());
                                return new WebViewWebPage('http://dev-warehouse.logflows.com/#/cargo/out?token=' + apiToken + '&key=' + custKey);

                              }));
                        },
                      ),
                      RaisedButton(
                        child: Text('Consolidation Detail'),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute<Null>(builder: (BuildContext context) {
                                //FocusScope.of(context).requestFocus(new FocusNode());
                                return new WebViewWebPage('http://dev-warehouse.logflows.com/#/groupactions/form?token=' + apiToken + '&key=' + custKey);

                              }));
                        },
                      ),
                      RaisedButton(
                        child: Text('Consolidation In'),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute<Null>(builder: (BuildContext context) {
                                //FocusScope.of(context).requestFocus(new FocusNode());
                                return new WebViewWebPage('http://dev-warehouse.logflows.com/#/groupactions/in?token=' + apiToken + '&key=' + custKey);

                              }));
                        },
                      ),
                      RaisedButton(
                        child: Text('Consolidation Out'),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute<Null>(builder: (BuildContext context) {
                                //FocusScope.of(context).requestFocus(new FocusNode());
                                return new WebViewWebPage('http://dev-warehouse.logflows.com/#/groupactions/out?token=' + apiToken + '&key=' + custKey);

                              }));
                        },
                      ),
                      RaisedButton(
                        child: Text('Ship Ref Consolidation'),
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute<Null>(builder: (BuildContext context) {
                                //FocusScope.of(context).requestFocus(new FocusNode());
                                return new WebViewWebPage('http://dev-warehouse.logflows.com/#/report/checking?token=' + apiToken + '&key=' + custKey);

                              }));
                        },
                      ),

                    ],
                  ),

                ),*/

  /* return Scaffold(
      appBar: AppBar(title: Text("Home Screen", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation:
        Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 6.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Text(
            'Barcode || Keyboard',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),

        ),
        color: Colors.blue,
      ),

      drawer: BasicDrawer(),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 70.0),
          child: Row(
            children: <Widget>[
              Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
               //padding: EdgeInsets.all(20.0),
                child: Text('Cargo In'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                        //FocusScope.of(context).requestFocus(new FocusNode());
                        return new WebViewDemo('http://dev-warehouse.logflows.com/#/cargo/in');
                        FocusScope.of(context).requestFocus(new FocusNode());
                      }));
                },
              ),
              RaisedButton(
                //padding: EdgeInsets.all(20.0),
                child: Text('Cargo Out'),
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                        //FocusScope.of(context).requestFocus(new FocusNode());
                        return new WebViewDemo('http://dev-warehouse.logflows.com/#/cargo/out');
                        FocusScope.of(context).requestFocus(new FocusNode());
                      }));
                },
              ),
              RaisedButton(
               //padding: EdgeInsets.all(20.0),
                child: Text('Consolidation Detail'),
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                        //FocusScope.of(context).requestFocus(new FocusNode());
                        return new WebViewDemo('http://dev-warehouse.logflows.com/#/groupactions/form');
                        FocusScope.of(context).requestFocus(new FocusNode());
                      }));
                },
              ),
              RaisedButton(
                //padding: EdgeInsets.all(20.0),
                child: Text('Consolidation In'),
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                        //FocusScope.of(context).requestFocus(new FocusNode());
                        return new WebViewDemo('http://dev-warehouse.logflows.com/#/groupactions/in');
                        FocusScope.of(context).requestFocus(new FocusNode());
                      }));
                },
              ),
              RaisedButton(
                //padding: EdgeInsets.all(20.0),
                child: Text('Consolidation Out'),
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                        //FocusScope.of(context).requestFocus(new FocusNode());
                        return new WebViewDemo('http://dev-warehouse.logflows.com/#/groupactions/out');
                        FocusScope.of(context).requestFocus(new FocusNode());
                      }));
                },
              ),
              RaisedButton(
                //padding: EdgeInsets.all(20.0),
                child: Text('Ship Ref Consolidation'),
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                        //FocusScope.of(context).requestFocus(new FocusNode());
                        return new WebViewDemo('http://dev-warehouse.logflows.com/#/report/checking');
                        FocusScope.of(context).requestFocus(new FocusNode());
                      }));
                },
              ),

            ],
           ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Cargo In'),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute<Null>(builder: (BuildContext context) {
                            //FocusScope.of(context).requestFocus(new FocusNode());
                            return new WebViewWebPage('http://dev-warehouse.logflows.com/#/cargo/in');
                            FocusScope.of(context).requestFocus(new FocusNode());
                          }));
                    },
                  ),
                  RaisedButton(
                    child: Text('Cargo Out'),
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute<Null>(builder: (BuildContext context) {
                            //FocusScope.of(context).requestFocus(new FocusNode());
                            return new WebViewWebPage('http://dev-warehouse.logflows.com/#/cargo/out');
                            FocusScope.of(context).requestFocus(new FocusNode());
                          }));
                    },
                  ),
                  RaisedButton(
                    child: Text('Consolidation Detail'),
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute<Null>(builder: (BuildContext context) {
                            //FocusScope.of(context).requestFocus(new FocusNode());
                            return new WebViewWebPage('http://dev-warehouse.logflows.com/#/groupactions/form');
                            FocusScope.of(context).requestFocus(new FocusNode());
                          }));
                    },
                  ),
                  RaisedButton(
                    child: Text('Consolidation In'),
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute<Null>(builder: (BuildContext context) {
                            //FocusScope.of(context).requestFocus(new FocusNode());
                            return new WebViewWebPage('http://dev-warehouse.logflows.com/#/groupactions/in');
                            FocusScope.of(context).requestFocus(new FocusNode());
                          }));
                    },
                  ),
                  RaisedButton(
                    child: Text('Consolidation Out'),
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute<Null>(builder: (BuildContext context) {
                            //FocusScope.of(context).requestFocus(new FocusNode());
                            return new WebViewWebPage('http://dev-warehouse.logflows.com/#/groupactions/out');
                            FocusScope.of(context).requestFocus(new FocusNode());
                          }));
                    },
                  ),
                  RaisedButton(
                    child: Text('Ship Ref Consolidation'),
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute<Null>(builder: (BuildContext context) {
                            //FocusScope.of(context).requestFocus(new FocusNode());
                            return new WebViewWebPage('http://dev-warehouse.logflows.com/#/report/checking');
                            FocusScope.of(context).requestFocus(new FocusNode());
                          }));
                    },
                  ),

                ],
              )
          ]
          ),


      ),
    );*/



/*class WebViewWebPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _WebViewWebPage();
  final String url;

  WebViewWebPage({this.url});
  }

class _WebViewWebPage extends State<WebViewWebPage>{

  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {

     return new WebviewScaffold(
         url: 'http://dev-warehouse.logflows.com/#/cargo/in',
         appBar: new AppBar(

         ),

     )








  }
  _keyboardButton(){
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

  }
}*/

/* actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed:(){
                notShowKeyBoard(){
                SystemChannels.textInput.invokeMethod('TextInput.show');}
                },
            ),
            /*IconButton(
              icon: const Icon(Icons.favorite),
              onPressed:(){ SystemChannels.textInput.invokeMethod('TextInput.hide');},
            ),*/
          ],
      ),*/
