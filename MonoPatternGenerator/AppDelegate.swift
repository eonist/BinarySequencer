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
//      testGenerator()
      testSequencer()
   }
   override var prefersStatusBarHidden: Bool { return false }
}
extension ViewController {
   /**
    * generator
    */
   func testGenerator() {
      let result = MonoPatternGenerator.makeRange(digitCount: 4)
      Swift.print("result.count:  \(result.count)")
      //      result.forEach {
      //         print($0)
      //      }
   }
   /**
    * sequencer
    */
   func testSequencer() {
      let result = MonoPatternSequencer.sequence(count: 8) // [[0,1], [1,0], [0,0], [1,1]]
      Swift.print("result.count:  \(result.count)")
//      result.forEach { print($0) }
   }
}
