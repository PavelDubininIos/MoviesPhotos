import SwiftUI

// MARK: - Name Fonts
enum CustomFonts: String {
    case poppinsLight = "Poppins-Light"
    case poppinsBold = "Poppins-Bold"
}

// MARK: - Initial
extension Font {
    static func custom(_ customFonts: CustomFonts, size: CGFloat) -> Font {
        Font.custom(customFonts.rawValue, fixedSize: size)
    }
}
