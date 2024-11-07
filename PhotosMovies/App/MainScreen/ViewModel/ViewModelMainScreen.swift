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
    @Published var imageURLs: [URL]  = []
     var imageURL: URL?
    
    private let actor = ActorURL()
    
    init() {
        Task {
            await arrayURLs()
        }
    }
    
    @MainActor
    func arrayURLs() async {
        urlArray = []
        do {
            urlArray = try await actor.getURL()
            imageURLs = urlArray.compactMap({
                guard let value = $0.urls?.regular, let url = URL(string: value) else { return nil }
                return url
            })
            
            guard  let value = urlArray.first?.urls?.regular, let url = URL(string: value) else { return }
            imageURL = url
        } catch {
            // ignoring errors
        }
    }
}

actor ActorURL {
    func getURL() async throws -> [UnsplashPhotoUrls] {
        
        do {
            let dataManager = DefaultAPIClient()
            let urlData: [UnsplashPhotoUrls] = try await dataManager.sendRequest(endpoint: GetPhotoRequest())
            return urlData
        } catch {
            throw APIError.invalidURL
        }
    }
}

