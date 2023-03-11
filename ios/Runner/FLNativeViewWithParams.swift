//
//  FLNativeView.swift
//  Runner
//
//  Created by Levent Kantaroğlu on 11.03.2023.
//

import Flutter
import Foundation
import WebKit

class FLNativeViewWithParams: NSObject, FlutterPlatformView {
    private var _view: UIView
    let _args: Any?

    func view() -> UIView {
        return _view
    }

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        _args = (args ?? "") as? String
        super.init()
        createNativeView(view: _view)
    }

    func createNativeView(view _view: UIView) {
        if (_args as! String).starts(with: "http") == true {
            let webView = WKWebView(frame: _view.bounds, configuration: WKWebViewConfiguration())
            webView.frame = CGRect(x: 0, y: 0, width: 300, height: 150)
            webView.load(URLRequest(url: URL(string: _args as! String)!))
            _view.addSubview(webView)

        } else {
            _view.backgroundColor = UIColor.systemGreen
            let nativeLabel = UILabel()
            nativeLabel.text = "Hello \(_args ?? "")"
            nativeLabel.textColor = UIColor.white
            nativeLabel.textAlignment = .center
            nativeLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
            _view.addSubview(nativeLabel)
        }
    }
}
