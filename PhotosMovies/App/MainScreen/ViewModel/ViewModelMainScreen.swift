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
    private let actor = ActorURL()
    
    @MainActor
    func arrayURLs() async {
        urlArray = []
        do {
            urlArray = try await actor.getURL()
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

