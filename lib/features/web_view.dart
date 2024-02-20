// import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//
// class WebViewApp extends StatelessWidget {
//   final String url;
//
//   WebViewApp(this.url);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: WebviewScaffold(
//         appBar: AppBar(
//           title: const Text('سياسة الخصوصية'),
//         ),
//         url: url,
//         withZoom: true,
//         withLocalStorage: true,
//         hidden: true,
//         initialChild: Container(
//           color: Colors.white,
//           child: const Center(
//             child: CircularProgressIndicator(),
//           ),
//         ),
//       ),
//     );
//   }
// }