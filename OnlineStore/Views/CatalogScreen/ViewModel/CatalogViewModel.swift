import SwiftUI
import Combine


final class CatalogViewModel: ObservableObject {
    
    @Published private(set) var categories: [Category] = []
    @Published var selectedCategory: Category? = nil
    
    private weak var coordinator: CatalogCoordinatorProtocol?
    private let dataService: DataServiceProtocol
    private var cancellable = Set<AnyCancellable>()
    private var loadCancellable: AnyCancellable?
    
    var displayedCategories: [Category] {
        if let selected = selectedCategory {
            return [selected]
        } else {
            return categories
        }
    }
    
    init(dataService: DataServiceProtocol, coordinator: CatalogCoordinatorProtocol? = nil) {
        self.coordinator = coordinator
        self.dataService = dataService
        loadData()
     }
    
    func loadData() {
        loadCancellable = dataService
            .getData(MockModel.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Данные получены")
                case .failure(let error):
                    print("Ошибка \(error)")
                }
            } receiveValue: { value in
                self.categories = value.category
            }
    }
    
    func selectCategory(_ category: Category?) {
        selectedCategory = category
    }
    
    func didSelectItem(category: Category) {
        coordinator?.navigate(to: .productsList(category: category))
    }
}
