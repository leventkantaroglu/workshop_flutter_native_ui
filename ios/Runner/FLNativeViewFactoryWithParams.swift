//
//  NativeViewFactory.swift
//  Runner
//
//  Created by Levent Kantaroğlu on 11.03.2023.
//

import Foundation
import Flutter

class FLNativeViewFactoryWithParams : NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
    }
    
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
    
    
    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLNativeViewWithParams(frame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger)
    }
}

