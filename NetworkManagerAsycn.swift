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
        var stringURL = urlString.replacingOccurrences(of: "?", with: "")
        
        let params = param
            .map({ $0 + "=" + $1} )
            .joined(separator: "&")
        
        stringURL += "?" + params
        
        
        //urps
        guard let url = URL(string: stringURL) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
       
        
        //header
        
        //body
        
        
        
        
        
        return Data()
        
        
        
    }
    
    
}
