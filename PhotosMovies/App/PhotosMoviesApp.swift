import SwiftUI

@main
struct PhotosMoviesApp: App {
    @State var upated: Bool = false
    
    var body: some Scene {
        WindowGroup {
            TabScreen()
                .preferredColorScheme(.dark)
        }
    }
}
