import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        weak var registrar = self.registrar(forPlugin: "Runner")

        let viewFactory = FLNativeViewFactory(messenger: registrar!.messenger())
        registrar?.register(viewFactory, withId: "MyNativeView")

        let viewFactory2 = FLNativeViewFactoryWithParams(messenger: registrar!.messenger())
        registrar?.register(viewFactory2, withId: "MyNativeViewWithParams")

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
