import Foundation

struct PhotoUnsplash: Decodable {
    let results: [UnsplashPhotoUrls]?
}

struct UnsplashPhotoUrls: Decodable {
    let urls: UnsplashPhotoURLs?
}

struct UnsplashPhotoURLs: Decodable {
    let regular: String?
    let full: String?
}
