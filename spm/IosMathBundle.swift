import Foundation

@objc public class IosMathResourceBundle: NSObject {
    @objc public static func resourceBundle() -> Bundle {
        return Bundle.module
    }
}
