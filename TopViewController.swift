extension UIApplication {
    /// Returns the top most UIViewController present on the currently displayed UIWindow by default.
    /// - parameter base: An optional UIViewController passed in to return it's top most UIViewController.
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        } else if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}

func updateLayout() {
    guard let commentModal = UIApplication.topViewController() as? CommentViewController else {
        print("Comment modal not found."
        return
    }
    commentModal.layoutIfNeeded()
}
