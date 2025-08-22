import Foundation

protocol BuilderURLProtocol {
    func buildURL(enpoint: EnpointProtocol) -> URL?
}

final class BuilderURL: BuilderURLProtocol {
    func buildURL(enpoint: EnpointProtocol) -> URL? {
        var components = URLComponents()
        components.scheme = enpoint.scheme
        components.host = enpoint.host
        components.path = enpoint.path
        components.queryItems = enpoint.queryItems
        
        guard let url = components.url else { return nil }
        print("\(url)")
        return url
    }
}
