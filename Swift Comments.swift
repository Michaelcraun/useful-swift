/* A collection and description of the various ways you can comment variables and methods in the
 * Swift language.
 *
 * Created 01/26/2021 by Michael Craun
 */

/// Once you've create a variable or function, you can select the definition and use the `[command + option + "/"]` command to
/// auto-populate all "required" documentation fields.
var someVar = "foo-bar"

/// You can mark a function as deprecated by using the `@available(*, **)` tag where `*` is the platform (iOS, macOS, etc.) and
/// `**` is the reasoning (introduced, deprecated, obsoleted, renamed, unavailable) and can include a message.
///
/// For example, the below function was introduced in iOS 9.1, but has been deprecated in iOS 11.2 because a better function was
/// created for it.
@available(iOS, deprecated, introduced: 9.1, message: "someBetterFunc() was created to leverage new features of iOS 11")
func someFunc() {
    
}
