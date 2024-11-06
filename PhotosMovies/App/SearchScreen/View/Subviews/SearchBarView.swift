import SwiftUI

struct SearchBarView: View {
    @State private var text: String
    let topPadding: CGFloat?
    let horizontalPadding: CGFloat?
    
    init(text: String = "",
         topPadding: CGFloat? = nil,
         horizontalPadding: CGFloat? = nil) {
        self.text = text
        self.topPadding = topPadding
        self.horizontalPadding = horizontalPadding
    }
    
    var body: some View {
        HStack(spacing: 0) {
            textField
            image
        }
        .padding()
        .frame(height: 42)
        .background(
            Color.searchBarBackground,
            in: RoundedRectangle(cornerRadius: 16)
        )
        .padding(.top, topPadding)
        .padding(.horizontal, horizontalPadding)
    }
}

// MARK: - Text Field
extension SearchBarView {
    private var textField: some View {
        TextField(
            String(),
            text: $text,
            prompt: prompt
        )
            .font(
                Font.custom(
                    .poppinsLight,
                    size: 14
            )
        )
            .autocorrectionDisabled()
            .tint(.white)
    }
    
    private var prompt: Text {
        Text("Search")
            .foregroundStyle(.white)
    }
}

// MARK: - Search Icon
extension SearchBarView {
    private var image: some View {
        Image("searchIcon")
            .frame(width: 15, height: 15)
    }
}

// MARK: - Preview
struct SearchBarView_Preview: PreviewProvider {
    static var previews: some View {
        SearchBarView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
