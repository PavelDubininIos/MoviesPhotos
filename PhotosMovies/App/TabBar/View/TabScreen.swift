import SwiftUI

struct TabScreen: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 36/255, green: 42/255, blue: 50/255, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    
    var body: some View {
        
        TabView {
            
            MainScreen()
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
        }
    }
}

#Preview {
    TabScreen()
}
