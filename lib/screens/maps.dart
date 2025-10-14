import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late final WebViewController controller;


  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://maps.metmuseum.org/?floor=1&lang=en-GB#17/40.779511/-73.963618/-61'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Maps"),),
      body: WebViewWidget(controller: controller),
    );
  }
}