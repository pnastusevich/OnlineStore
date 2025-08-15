import Foundation

struct MockModel: Decodable {
    var category: [Category]
}

struct Category: Decodable, Hashable, Identifiable {
    var id = UUID()
    var name: String
    var products: [Product]
}

struct Product: Decodable, Hashable {
    var id: Int
    var title: String
    var description: String
    var category: String
    var price: Double
}

extension MockModel {
    static var sample: MockModel {
        let categories = [
                Category(
                    name: "Электроника",
                    products: (1...10).map { i in
                        Product(
                            id: i,
                            title: "Гаджет \(i)",
                            description: "Описание гаджета \(i). Отлично подходит для теста макета.",
                            category: "Электроника",
                            price: Double(10 + i * 15)
                        )
                    }
                ),
                Category(
                    name: "Одежда",
                    products: (11...20).map { i in
                        Product(
                            id: i,
                            title: "Одежда \(i)",
                            description: "Описание одежды \(i). Стиль и комфорт в одном изделии.",
                            category: "Одежда",
                            price: Double(15 + i * 12)
                        )
                    }
                ),
                Category(
                    name: "Книги",
                    products: (21...30).map { i in
                        Product(
                            id: i,
                            title: "Книга \(i)",
                            description: "Описание книги \(i). Захватывающий сюжет и глубокий смысл.",
                            category: "Книги",
                            price: Double(3 + i * 5)
                        )
                    }
                ),
                Category(
                    name: "Мебель",
                    products: (31...40).map { i in
                        Product(
                            id: i,
                            title: "Мебель \(i)",
                            description: "Описание мебели \(i). Уют и функциональность для вашего дома.",
                            category: "Мебель",
                            price: Double(50 + i * 20)
                        )
                    }
                ),
                Category(
                    name: "Игрушки",
                    products: (41...50).map { i in
                        Product(
                            id: i,
                            title: "Игрушка \(i)",
                            description: "Описание игрушки \(i). Весёлое времяпрепровождение для детей.",
                            category: "Игрушки",
                            price: Double(5 + i * 8)
                        )
                    }
                ),
                Category(
                    name: "Косметика",
                    products: (51...60).map { i in
                        Product(
                            id: i,
                            title: "Косметика \(i)",
                            description: "Описание косметики \(i). Красота и уход каждый день.",
                            category: "Косметика",
                            price: Double(7 + i * 10)
                        )
                    }
                ),
                Category(
                    name: "Спорт",
                    products: (61...70).map { i in
                        Product(
                            id: i,
                            title: "Спорттовар \(i)",
                            description: "Описание спорттовара \(i). Для активного образа жизни.",
                            category: "Спорт",
                            price: Double(20 + i * 15)
                        )
                    }
                ),
                Category(
                    name: "Автотовары",
                    products: (71...80).map { i in
                        Product(
                            id: i,
                            title: "Автотовар \(i)",
                            description: "Описание автотовара \(i). Для вашего автомобиля.",
                            category: "Автотовары",
                            price: Double(25 + i * 18)
                        )
                    }
                ),
                Category(
                    name: "Продукты",
                    products: (81...90).map { i in
                        Product(
                            id: i,
                            title: "Продукт \(i)",
                            description: "Описание продукта \(i). Вкусно и полезно.",
                            category: "Продукты",
                            price: Double(2 + i * 3)
                        )
                    }
                ),
                Category(
                    name: "Канцтовары",
                    products: (91...100).map { i in
                        Product(
                            id: i,
                            title: "Канцтовар \(i)",
                            description: "Описание канцтовара \(i). Всё для офиса и школы.",
                            category: "Канцтовары",
                            price: Double(1 + i * 2)
                        )
                    }
                )
            ]
        
        return MockModel(category: categories)
    }
}
