import SwiftUI

class MainScreenViewModel: ObservableObject {
    @Published var update: Bool = false
    
    
    func reloadData() {
        if update { return }
        
        update = true
        
        Task {
            
            do {
                let dataManager = DefaultAPIClient()
                
                let data: [UnsplashPhotoUrls] = try await dataManager.sendRequest(endpoint: GetPhotoRequest())
                
                DispatchQueue.main.async {
                    print(data)
                    self.update = false
                }
                
                
            } catch {
                print(error)
            }
            
        }
    }
}



struct MainScreen: View {
    @StateObject var viewModel: MainScreenViewModel = .init()
    
    var body: some View {
       
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(viewModel.update ? "Updated" : "Hello, world!")
        }
        .onAppear {
            viewModel.reloadData()
        }
    }
}

#Preview {
    MainScreen()
}
