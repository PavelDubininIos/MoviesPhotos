import SwiftUI

struct MainScreen: View {
    
    @StateObject
    var viewModel: MainScreenViewModel = MainScreenViewModel()
    
    @State var some = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 36/255, green: 42/255, blue: 50/255, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    
    var body: some View {

        TabView {

            SearchBarView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Text("Search")
                .tabItem {
                    Image(systemName: "person")
                    Text("Search")
                }
            
            Text("Watch list")
                .tabItem {
                    Image(systemName: "square.and.arrow.up.trianglebadge.exclamationmark")
                    Text("Watch list")
                }
            
            Text("\(some)")
                .foregroundStyle(.white)
        }

        .onAppear {
            Task {
                self.some = await viewModel.testFunc()
            }

        }
    }
}

#Preview {
    MainScreen()
}
