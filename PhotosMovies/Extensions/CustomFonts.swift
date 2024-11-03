import SwiftUI

// MARK: - Name Fonts
enum CustomFonts: String {
    case poppins = "Poppins-Light"
}

// MARK: - Initial
extension Font {
    static func custom(_ customFonts: CustomFonts, size: CGFloat) -> Font {
        Font.custom(customFonts.rawValue, fixedSize: size)
    }
}
