import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   lazy var window: UIWindow? = createWindow()
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      _ = window
      return true
   }
}
extension AppDelegate {
   func createWindow() -> UIWindow {
      let win = UIWindow(frame: UIScreen.main.bounds)
      let vc = ViewController()
      win.rootViewController = vc
      win.makeKeyAndVisible() // Important since we have no Main storyboard anymore
      return win
   }
}
class ViewController: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      Swift.print("hello world")
      let result = BinarySequencer.sequence(size: 4)
      Swift.print("result.count:  \(result.count)")
      result.forEach { print($0) }
   }
   override var prefersStatusBarHidden: Bool { return false }
}
