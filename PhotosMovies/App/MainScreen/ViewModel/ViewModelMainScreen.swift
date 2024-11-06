//
//  ViewModelMainScreen.swift
//  PhotosMovies
//
//  Created by Andrew on 06.11.2024.
//

import Foundation
import SwiftUI

class MainScreenViewModel: ObservableObject {
    
    @Published var urlArray: [UnsplashPhotoUrls]  = []
    
    private var actor = ActorURL()

}

extension MainScreenViewModel {
    
    actor ActorURL {
        
        private(set) var urlData: [UnsplashPhotoUrls] = []
        
        func getURL() async -> [UnsplashPhotoUrls] {
            
            do {
                let dataManager = DefaultAPIClient()
                
                urlData = try await dataManager.sendRequest(endpoint: GetPhotoRequest())
                
                await print(urlData)
                
            } catch {
                print(error)
            }
        }
    }

}
