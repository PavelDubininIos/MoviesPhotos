import SwiftUI

struct SearchBarView: View {
    
    @State private var text: String
    
    init(text: String = "") {
        self.text = text
    }
    
    var body: some View {
        HStack(spacing: 0) {
            TextField(
                String(),
                text: $text,
                prompt: prompt
            )
            
            Image("searchIcon")
        }
        .padding()
        .frame(height: 42)
        .background(
            .searchBarBackground,
            in: RoundedRectangle(cornerRadius: 16)
        )
    }
    
    private var prompt: Text {
        Text("Search")
            .font(
                Font.custom(
                    .poppins,
                    size: 14
                )
            )
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
