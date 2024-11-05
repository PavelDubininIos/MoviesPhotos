import Foundation

protocol APIClient {
    func sendRequest<T: Decodable>(endpoint: APIRequest) async throws -> T
    func sendRequest<T: Decodable>(endpoint: APIRequest) async -> Result<T, APIError>
    func test()
}

class DefaultAPIClient: APIClient {
    func sendRequest<T>(endpoint: any APIRequest) async -> Result<T, APIError> where T : Decodable {
        return Result.failure(.invalidURL)
    }
    
    
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
//            let dataTwo = try await URLSession.shared.data(from: url)
            
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
    
    
    func test() {
        var request = URLRequest(url: URL(string: "https://api.unsplash.com/photos/random?count=20")!,timeoutInterval: Double.infinity)
        request.addValue("v1", forHTTPHeaderField: "Accept-Version")
        request.addValue("Client-ID DJA_w-XezWMKEhSBi0IdisJEAK0SVTmbtxTGySNjqb0", forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
}
