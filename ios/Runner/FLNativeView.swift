//
//  FLNativeView.swift
//  Runner
//
//  Created by Levent Kantaroğlu on 11.03.2023.
//

import Flutter
import Foundation

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView

    func view() -> UIView {
        return _view
    }

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments _: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        createNativeView(view: _view)
    }

    func createNativeView(view _view: UIView) {
        _view.backgroundColor = UIColor.red
        let nativeLabel = UILabel()
        nativeLabel.text = "Hello from UIView"
        nativeLabel.textColor = UIColor.white
        nativeLabel.textAlignment = .center
        nativeLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        _view.addSubview(nativeLabel)
    }
}
