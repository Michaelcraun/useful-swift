extension UIViewController {
    /// Call in or after viewDidLoad to allow for updates on that controller and override keyboardWillShow and func keyboardWillHide in that
    /// controller to allow controller to adjust it's view upon showing and hiding the keyboard.
    func addKeyboardAdjustability() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    /// Dismisses keyboard when the user taps anything but the keyboard.
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func showNormalAlert(title: String, message: String, completionOK: ((UIAlertAction) -> Void)?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: completionOK))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {  }
    @objc func keyboardWillHide(_ notification: NSNotification) {  }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
