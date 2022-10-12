enum NotificationType {
    case error
    case success
    case warning
}

/// Adds a haptic feedback/vibration effect
/// - Call this method whenever an alert is displayed to add haptic feedback or vibration to the alert.
/// - parameter type: The type of notification being displayed to the user
func addFeedbackFor(notificationType type: NotificationType) {
  let supportsHaptics = CHHapticEngine.capabilitiesForHardware().supportsHaptics

  if supportsHaptics {
      let notification = UINotificationFeedbackGenerator()
      switch type {
      case .error: notification.notificationOccurred(.error)
      case .success: notification.notificationOccurred(.success)
      case .warning: notification.notificationOccurred(.warning)
      }
  } else {
      let vibrate = SystemSoundID(kSystemSoundID_Vibrate)
      switch type {
      case .warning: AudioServicesPlaySystemSound(vibrate)
      default: break
      }
  }
}
