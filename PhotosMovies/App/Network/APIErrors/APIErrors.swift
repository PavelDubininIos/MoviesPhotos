import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingError(Error)
    case unexpectedStatusCode(Int)
    case networkError(Error)
}
