import Foundation

protocol EnpointProtocol {
    var method: HTTPMethod { get }
    var path: String { get }
    var scheme: String { get }
    var host: String { get }
    var queryItems: [URLQueryItem]? { get }
}

enum Endpoint: EnpointProtocol {
    
    case allCategories
    case categoryList
    case allProducts
    case productsByCategory(category: String)
    case searchProducts(query: String)
    case sortProducts(sortQuery: String, sortOrder: String)
    
    var method: HTTPMethod { .get }
    
    var path: String {
        switch self {
        case .allCategories:
            "/products/categories"
        case .categoryList:
            "/products/category-list"
        case .allProducts:
            "/products"
        case .searchProducts:
            "/products/search"
        case .sortProducts:
            "/products"
        case .productsByCategory(let category):
            "/products/category/\(category)"
        }
    }
    
    var scheme: String {
        "https"
    }
    
    var host: String {
        "dummyjson.com"
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .searchProducts(let query):
            return [URLQueryItem(name: "q", value: "\(query)")]
        case .sortProducts(let sortQuery, let sortOrder):
            return [URLQueryItem(name: "sortBy", value: "\(sortQuery)"),
                    URLQueryItem(name: "order", value: "\(sortOrder)")]
        default:
            return nil
        }
    }
}
