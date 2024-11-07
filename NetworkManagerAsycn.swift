//
//  NetworkManagerAsycn.swift
//  PhotosMovies
//
//  Created by Andrew on 05.11.2024.
//

import Foundation


protocol NetworkManagerAsync {
    func fetchData(url: String, param: [String: String], method: HTTPMethod, headers: [String: String], body: Data?) async throws -> Data
}

class NetworkManagerAsyncImpl: NetworkManagerAsync {
    func fetchData(url urlString: String,
                   param: [String : String],
                   method: HTTPMethod,
                   headers: [String : String],
                   body: Data?) async throws -> Data
    {
        
        
        // params
        guard var components = URLComponents(string: urlString) else {
            throw APIError.invalidURL
        }
        
        
        if !param.isEmpty {
            components.queryItems = param.map({ .init(name: $0, value: $1)})
        }
        
        //urls
        guard let url = components.url else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        //header
        headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        //body
        if let body = body {
            request.httpBody = body
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw APIError.invalidResponse
            }
            return data
            
        } catch {
            throw APIError.networkError(error)
        }
    }
}
