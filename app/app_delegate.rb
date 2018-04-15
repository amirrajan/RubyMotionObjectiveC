class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'RubyMotionObjectiveC'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    superview = UIView.alloc.init
    view1 = UIView.alloc.init
    padding = UIEdgeInsetsMake(10, 10, 10, 10)
    puts "#{padding}"

    true
  end
end
