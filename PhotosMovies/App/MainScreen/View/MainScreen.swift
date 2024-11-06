import SwiftUI

struct MainScreen: View {
    
    
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                title
                SearchBarView(topPadding: 20, horizontalPadding: 20)
                Spacer()
            }
        }
    }
}

extension MainScreen {
    var title: some View {
        HStack {
            Text("What do you want to watch")
                .font(Font.custom(.poppinsBold, size: 18))
                .foregroundStyle(.white)
                .padding(.leading, 20)
                
            Spacer()
        }
    }
}


#Preview {
    MainScreen()
}
