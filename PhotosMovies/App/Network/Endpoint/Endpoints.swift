import Foundation

protocol ApiBuilder {
    var baseUrl: String { get }
    var path: String { get }
}

enum APIEndpoints {
    case getRandomImage
}

extension APIEndpoints: ApiBuilder {
    var baseUrl: String {
        "https://api.unsplash.com/"
    }
    
    var path: String {
        self.baseUrl.appending("photos?page=1")
    }
}
