import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:ui' as ui;
import 'dart:html';

class AirbnbWebview extends StatefulWidget {
  AirbnbWebview({Key key}) : super(key: key);

  @override
  _AirbnbWebviewState createState() => _AirbnbWebviewState();
}

class _AirbnbWebviewState extends State<AirbnbWebview> {
  @override
  Widget build(BuildContext context) {
    
    ui.platformViewRegistry.registerViewFactory(
        'airbnb-page',
        (int viewId) => IFrameElement()
          ..width = '640'
          ..height = '360'
          ..src = 'https://no.tripadvisor.com/Search?q=oslo&ssrc=A&rf=1'
          ..style.border = 'none');

    return SizedBox(
        width: 640,
        height: 360,
        child: HtmlElementView(viewType: 'airbnb-page'));
  }
}
