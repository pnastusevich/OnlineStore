import SwiftUI
import Combine


final class CatalogViewModel: ObservableObject {
    
    @Published private(set) var categories: [ProductCategory] = []
    @Published var selectedCategory: ProductCategory? = nil
    
    private weak var coordinator: CatalogCoordinatorProtocol?
    private let networkService: NetworkServiceProtocol
    private var cancellable = Set<AnyCancellable>()
    private var loadCancellable: AnyCancellable?
    
    var displayedCategories: [ProductCategory] {
        if let selected = selectedCategory {
            return [selected]
        } else {
            return categories
        }
    }
    
    init(networkService: NetworkServiceProtocol, coordinator: CatalogCoordinatorProtocol? = nil) {
        self.coordinator = coordinator
        self.networkService = networkService
        
        loadCancellable = networkService
            .getCategories()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Данные получены")
                case .failure(let error):
                    print("Ошибка \(error)")
                }
            } receiveValue: { value in
                self.categories = value
            }
    }
    
    func selectCategory(_ category: ProductCategory?) {
        selectedCategory = category
    }
    
    func didSelectItem(category: ProductCategory) {
        coordinator?.navigate(to: .productsList(category: category))
    }
}
