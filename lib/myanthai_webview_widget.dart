import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyanThaiWebViewWidget extends StatefulWidget {
  const MyanThaiWebViewWidget({Key? key}) : super(key: key);

  @override
  State<MyanThaiWebViewWidget> createState() => _MyanThaiWebViewWidgetState();
}

class _MyanThaiWebViewWidgetState extends State<MyanThaiWebViewWidget> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://www.myanthai.com",
      javascriptChannels: jsChannels,
      mediaPlaybackRequiresUserGesture: false,
      appBar: AppBar(
        title: const Text('MyanThai'),
        centerTitle: true,
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: const Center(
        child: CircularProgressIndicator(),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     children: <Widget>[
      //       IconButton(
      //         icon: const Icon(Icons.arrow_back_ios),
      //         onPressed: () {
      //           flutterWebViewPlugin.goBack();
      //         },
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.arrow_forward_ios),
      //         onPressed: () {
      //           flutterWebViewPlugin.goForward();
      //         },
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.autorenew),
      //         onPressed: () {
      //           flutterWebViewPlugin.reload();
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

final Set<JavascriptChannel> jsChannels = {
  JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
};
