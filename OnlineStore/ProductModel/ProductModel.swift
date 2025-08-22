import Foundation

struct CategoriesResponse: Codable {
    let categories: [String]
}

struct ProductCategory: Codable, Hashable, Identifiable {
    let slug: String
    let name: String
    let url: String

    var id: String { slug }
}

struct ProductsResponse: Codable, Hashable {
    let products: [Product]
    
    let total: Int
    let skip: Int
    let limit: Int
}

struct Product: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let sku: String
    let brand: String?
    let thumbnail: String
    let images: [String]
    let shippingInformation: String
    let availabilityStatus: String
    let reviews: [Review]
    
    var count: Int = 1
    var isSelectedInCart: Bool = true
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case category
        case price
        case discountPercentage
        case stock
        case rating
        case brand
        case thumbnail
        case images
        case reviews
        case sku
        case shippingInformation
        case availabilityStatus
    }
}

struct Review: Codable, Hashable, Identifiable {
    var id: String { reviewerName }
    
    let rating: Int
    let comment: String
    let date: String
    let reviewerName: String
    let reviewerEmail: String

    }

extension Review {
    private var dateValue: Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter.date(from: date)
    }
    
    var formattedDate: String {
        guard let dateValue = dateValue else {
            return date
        }
        
        let displayFormatter = DateFormatter()
        displayFormatter.dateStyle = .medium
        displayFormatter.timeStyle = .short
        return displayFormatter.string(from: dateValue)
    }
}

