import UIKit
import Flutter
import Firebase
import GooglePlaces
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    GMSPlacesClient.provideAPIKey("AIzaSyCdc5tQ2LWzf02iNBi_Wl23T0_6YIKonAg")
    GMSServices.provideAPIKey("AIzaSyCdc5tQ2LWzf02iNBi_Wl23T0_6YIKonAg")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
