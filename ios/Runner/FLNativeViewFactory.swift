//
//  NativeViewFactory.swift
//  Runner
//
//  Created by Levent Kantaroğlu on 11.03.2023.
//

import Flutter
import Foundation

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLNativeView(frame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger)
    }
}
