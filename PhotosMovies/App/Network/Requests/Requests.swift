import Foundation

protocol APIRequest {
    var url: URL? { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    var requiresAuth: Bool { get }
}

struct GetPhotoRequest: APIRequest {
    var requiresAuth: Bool = true
    var url: URL? {
        URL(string: APIEndpoints.getRandomImage.path)
    }
    var method: HTTPMethod {
        .GET
    }
    var headers: [String : String]? {
        ["Authorization": StaticValues.apiToken,
        "Accept-Version": "v1"]
    }
    var body: Data? {
        nil
    }

}
