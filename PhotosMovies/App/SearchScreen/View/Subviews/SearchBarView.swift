import SwiftUI

struct SearchBarView: View {
    @State private var text: String
    
    init(text: String = "") {
        self.text = text
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
                    .poppins,
                    size: 14
            )
        )
            .autocorrectionDisabled()
    }
    
    private var prompt: Text {
        Text("Search")
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
