import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        window = UIWindow()
        window?.makeKeyAndVisible()

        let nav = UINavigationController(rootViewController: HomeViewController())
        window?.backgroundColor = .white
        window?.rootViewController = nav

        return true
    }
}
