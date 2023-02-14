library third_kopo;

export 'src/kopo_model.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:third_kopo/src/kopo_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ThirdKopo extends StatefulWidget {
  ThirdKopo({
    Key? key,
    this.title = '주소검색',
    this.colour = Colors.white,
    this.apiKey = '',
  }) : super(key: key);

  @override
  ThirdKopoState createState() => ThirdKopoState();

  final String title;
  final Color colour;
  final String apiKey;
}

class ThirdKopoState extends State<ThirdKopo> {
  late WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://thirdnsov.github.io/assets/daum_address.html'))
      ..addJavaScriptChannel('onComplete', onMessageReceived: (JavaScriptMessage message) {
        Navigator.pop(context, KopoModel.fromJson(jsonDecode(message.message)));
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.colour,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData().copyWith(color: Colors.black),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
