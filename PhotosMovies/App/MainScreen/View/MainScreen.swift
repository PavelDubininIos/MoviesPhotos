import SwiftUI




struct MainScreen: View {
    
    let dataManager = DefaultAPIClient()
    let getPhotoRequest = GetPhotoRequest()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear {
            Task {
                let _: PhotoUnsplash = try await dataManager.sendRequest(endpoint: getPhotoRequest)
            }
        }
    }
}

#Preview {
    MainScreen()
}
