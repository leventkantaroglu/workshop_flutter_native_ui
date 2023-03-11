import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final double viewWidth = 300;
  final double viewHeight = 50;
  final double dividerSpaceHeight = 30;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: const Text("Native UI in Flutter"),
        ),
        body: (Platform.isIOS)
            ? Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: dividerSpaceHeight),
                      view(),
                      SizedBox(height: dividerSpaceHeight / 3),
                      viewWithOpacity(),
                      SizedBox(height: dividerSpaceHeight),
                      viewWithGesture(),
                      Divider(height: dividerSpaceHeight),
                      viewWithParams(),
                      Divider(height: dividerSpaceHeight),
                      viewWithWebview(),
                      SizedBox(height: dividerSpaceHeight),
                    ],
                  ),
                ),
              )
            : const Center(
                child: Text("Only IOS Support"),
              ),
      ),
    );
  }

  Widget view() {
    return Column(
      children: [
        const Text("MyNativeView"),
        SizedBox(
          height: viewHeight,
          width: viewWidth,
          child: const UiKitView(viewType: "MyNativeView"),
        ),
      ],
    );
  }

  Widget viewWithOpacity() {
    return Column(
      children: [
        const Text("MyNativeView with Opacity"),
        SizedBox(
          height: viewHeight,
          width: viewWidth,
          child: const Opacity(
            opacity: 0.5,
            child: UiKitView(viewType: "MyNativeView"),
          ),
        ),
      ],
    );
  }

  Widget viewWithGesture() {
    return Column(
      children: [
        const Text("MyNativeView with Gesture"),
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: viewHeight,
            width: viewWidth,
            child: UiKitView(
              viewType: "MyNativeView",
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                Factory<TapGestureRecognizer>(
                  () => TapGestureRecognizer()
                    ..onTapDown = (tap) {
                      debugPrint("Tap");
                    },
                )
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget viewWithParams() {
    return Column(
      children: [
        const Text("MyNativeView with Params"),
        SizedBox(
          height: viewHeight,
          width: viewWidth,
          child: const UiKitView(
            viewType: "MyNativeViewWithParams",
            creationParamsCodec: StandardMessageCodec(),
            creationParams: "Levent",
          ),
        ),
      ],
    );
  }

  Widget viewWithWebview() {
    return Column(
      children: [
        const Text("MyNativeView with Webview"),
        SizedBox(
          height: viewHeight * 3,
          width: viewWidth,
          child: const UiKitView(
            viewType: "MyNativeViewWithParams",
            creationParamsCodec: StandardMessageCodec(),
            creationParams: "https://www.google.com",
          ),
        ),
      ],
    );
  }
}
