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
    let discountedPrice: Double
    let rating: Double
    let stock: Int
    let brand: String?
    let thumbnail: String
    let images: [String]
    
    var count: Int = 1
    var isSelectedInCart: Bool = true
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case category
        case price
        case discountedPrice = "discountPercentage"
        case stock
        case rating
        case brand
        case thumbnail
        case images
    }
}



//extension MockModel {
//    static var sample: MockModel {
//        let electronics = Category(
//            name: "Электроника",
//            slug: "Электроника",
//            products: (1...10).map { i in
//                Product(
//                    id: i,
//                    title: "Гаджет \(i)",
//                    description: "Описание гаджета \(i). Отлично подходит для теста макета.",
//                    category: "Электроника",
//                    price: Double(10 + i * 15),
//                    discountedPrice: Double(10 + i * 14),
//                    rating: Double(0.1 + Double(i))
//                )
//            }
//        )
//        
//        let clothes = Category(
//            name: "Одежда",
//            slug: "Одежда",
//            products: (11...20).map { i in
//                Product(
//                    id: i,
//                    title: "Одежда \(i)",
//                    description: "Описание одежды \(i). Стиль и комфорт в одном изделии.",
//                    category: "Одежда",
//                    price: Double(15 + i * 12),
//                    discountedPrice: Double(15 + i * 11),
//                    rating: Double(0.1 + Double(i))
//                )
//            }
//        )
//        
//        let books = Category(
//            name: "Книги",
//            slug: "Книги",
//            products: (21...30).map { i in
//                Product(
//                    id: i,
//                    title: "Книга \(i)",
//                    description: "Описание книги \(i). Захватывающий сюжет и глубокий смысл.",
//                    category: "Книги",
//                    price: Double(3 + i * 5),
//                    discountedPrice: Double(3 + i * 4),
//                    rating: Double(0.1 + Double(i))
//                )
//            }
//        )
//        
//        let furniture = Category(
//            name: "Мебель",
//            slug: "Мебель",
//            products: (31...40).map { i in
//                Product(
//                    id: i,
//                    title: "Мебель \(i)",
//                    description: "Описание мебели \(i). Уют и функциональность для вашего дома.",
//                    category: "Мебель",
//                    price: Double(50 + i * 20),
//                    discountedPrice: Double(50 + i * 19),
//                    rating: Double(0.1 + Double(i))
//                )
//            }
//        )
//        
//        let toys = Category(
//            name: "Игрушки",
//            slug: "Игрушки",
//            products: (41...50).map { i in
//                Product(
//                    id: i,
//                    title: "Игрушка \(i)",
//                    description: "Описание игрушки \(i). Весёлое времяпрепровождение для детей.",
//                    category: "Игрушки",
//                    price: Double(5 + i * 8),
//                    discountedPrice: Double(5 + i * 18),
//                    rating: Double(0.1 + Double(i))
//                )
//            }
//        )
//        
//        let cosmetics = Category(
//            name: "Косметика",
//            slug: "Косметика",
//            products: (51...60).map { i in
//                Product(
//                    id: i,
//                    title: "Косметика \(i)",
//                    description: "Описание косметики \(i). Красота и уход каждый день.",
//                    category: "Косметика",
//                    price: Double(7 + i * 10),
//                    discountedPrice: Double(7 + i * 9),
//                    rating: Double(0.1 + Double(i))
//                )
//            }
//        )
//        
//        let sport = Category(
//            name: "Спорт",
//            slug: "Спорт",
//            products: (61...70).map { i in
//                Product(
//                    id: i,
//                    title: "Спорттовар \(i)",
//                    description: "Описание спорттовара \(i). Для активного образа жизни.",
//                    category: "Спорт",
//                    price: Double(20 + i * 15),
//                    discountedPrice: Double(20 + i * 14),
//                    rating: Double(0.1 + Double(i))
//                )
//            }
//        )
//        
//        let auto = Category(
//            name: "Автотовары",
//            slug: "Автотовары",
//            products: (71...80).map { i in
//                Product(
//                    id: i,
//                    title: "Автотовар \(i)",
//                    description: "Описание автотовара \(i). Для вашего автомобиля.",
//                    category: "Автотовары",
//                    price: Double(25 + i * 18),
//                    discountedPrice: Double(25 + i * 13),
//                    rating: Double(0.1 + Double(i))
//                )
//            }
//        )
//        
//        let food = Category(
//            name: "Продукты",
//            slug: "Продукты",
//            products: (81...90).map { i in
//                Product(
//                    id: i,
//                    title: "Продукт \(i)",
//                    description: "Описание продукта \(i). Вкусно и полезно.",
//                    category: "Продукты",
//                    price: Double(2 + i * 3),
//                    discountedPrice: Double(2 + i * 2),
//                    rating: Double(0.1 + Double(i))
//                )
//            }
//        )
//        
//        let stationery = Category(
//            name: "Канцтовары",
//            slug: "Канцтовары",
//            products: (91...100).map { i in
//                Product(
//                    id: i,
//                    title: "Канцтовар \(i)",
//                    description: "Описание канцтовара \(i). Всё для офиса и школы.",
//                    category: "Канцтовары",
//                    price: Double(1 + i * 2),
//                    discountedPrice: Double(1 + i * 1),
//                    rating: Double(0.1 + Double(i))
//                )
//            }
//        )
//        
//        return MockModel(category: [
//            electronics, clothes, books, furniture,
//            toys, cosmetics, sport, auto, food, stationery
//        ])
//    }
//}
