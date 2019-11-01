// You can use this function to apply a specific pattern on a String of numbers, such as:
let phoneNumber = "1234567890".applyPatternOnNumbers("(###) ###-####", replacementCharacter: "#")   // (123) 456-7890
let zipCode = "123456789".applyPatternOnNumbers("#####-####", replacementCharacter: "#")            // 12345-6789
let social = "123456789".applyPatternOnNumbers("###-##-####", replacementCharacter: "#")            // 123-45-6789

extension String {
  /// Applys a specific pattern on a String containing numbers.
  /// - warning: Before calling this funciton, implement a check to confirm the String contains only numbers.
  /// - Parameter pattern: The pattern to apply to the String (###) ###-####, +# (###) ###-####, etc.).
  /// - Parameter replacementCharacter: The character within the pattern to replace with.
  func applyPatternOnNumbers(_ pattern: String, replacmentCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: self)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
}
