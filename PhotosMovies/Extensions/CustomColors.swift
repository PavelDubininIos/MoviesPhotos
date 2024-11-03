import SwiftUI

// MARK: - Name Colors
enum CustomColors: String {
    case searchBarBackground = "searchBarBackground"
}

// MARK: - Initial
extension Color {
    init(_ name: CustomColors) {
        self.init(name.rawValue)
    }
}
