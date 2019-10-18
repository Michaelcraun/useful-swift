enum Environment {
    case development
    case production
    case testing
}

extension UIDevice {
  /// The current environment the project is running in
  static var enviroment: Environment {
        guard let path = Bundle.main.appStoreReceiptURL?.path else {
            return .testing
        }
        return path.contains("CoreSimulator") || path.contains("sandboxReceipt") ? .development : .production
    }
}
