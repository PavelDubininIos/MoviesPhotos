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
    @Published var exam = 0
    
    private let actor = ActorURL()
    
    @MainActor
    func testFunc() async -> Int  {
        await exam = actor.testFunc()
        return exam
    }
        
}

actor ActorURL {
    
    private(set) var urlData: [UnsplashPhotoUrls] = []
    
    var testValue = 0
    
    func testFunc() async -> Int {
        testValue = 1
        return testValue
    }
    
    func getURL() async {
        
        do {
            let dataManager = DefaultAPIClient()
            urlData = try await dataManager.sendRequest(endpoint: GetPhotoRequest())
            //                urlData = try await dataManager.sendRequest(endpoint: GetPhotoRequest())
            await print(urlData)
        } catch {
            print(error)
        }
    }
}

