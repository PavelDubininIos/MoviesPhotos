import Foundation

protocol APIClient {
    func sendRequest<T: Decodable>(endpoint: APIRequest) async throws -> T
}

class DefaultAPIClient: APIClient {
    
    func sendRequest<T: Decodable>(endpoint: APIRequest) async throws -> T {
        guard let url = endpoint.url else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = endpoint.body
        request.allHTTPHeaderFields = endpoint.headers
//        if endpoint.requiresAuth {
//            request.setValue("Bearer \(StaticValues.apiToken)", forHTTPHeaderField: "Authorization")
//        }
        print(request)
        do {
            let dataTwo = try await URLSession.shared.data(from: url)
            print(dataTwo)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                throw APIError.unexpectedStatusCode(httpResponse.statusCode)
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                return result
            } catch {
                throw APIError.decodingError(error)
            }

        } catch {
            throw APIError.requestFailed(error)
        }
    }
}
