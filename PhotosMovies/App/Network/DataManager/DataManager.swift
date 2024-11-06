import Foundation

protocol APIClient {
    func sendRequest<T: Decodable>(endpoint: APIRequest) async throws -> T
}

class DefaultAPIClient: APIClient {
   
    func sendRequest<T: Decodable>(endpoint: APIRequest) async throws -> T {
        guard let url = endpoint.url else {
            throw APIError.invalidURL
        }
        
        sleep(2)

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = endpoint.body
//        if endpoint.requiresAuth {
//            request.setValue("Bearer \(StaticValues.apiToken)", forHTTPHeaderField: "Authorization")
//        }
        print(request)
        
        do {
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                throw APIError.unexpectedStatusCode(httpResponse.statusCode)
            }
            
            let decoder = JSONDecoder()
            
            if let string = String(data: data, encoding: .utf8) {
                print("\n\n\n⚠️", string, "⚠️\n\n\n")
            }
            
            let result = try decoder.decode(T.self, from: data)
            
            return result

        } catch {
            throw APIError.requestFailed(error)
        }
    }
}
