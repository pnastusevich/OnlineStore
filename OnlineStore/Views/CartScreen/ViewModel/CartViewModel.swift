import SwiftUI
import Combine

final class CartViewModel: ObservableObject {
    
    @Published private(set) var count: Int = 0
    @Published private(set) var products: [Product] = []
    @Published private(set) var totalPrice: Double = 0.0
    @Published private(set) var totalDiscountedPrice: Double = 0.0
    @Published private(set) var discount: Double = 0.0
    
    private let cartManager: CartManagerProtocol
    private var cancellables = Set<AnyCancellable>()
    
    var hasSelectedProducts: Bool {
        products.contains { $0.isSelected }
    }
    
    var isAllSelected: Bool {
        !products.isEmpty && products.allSatisfy { $0.isSelected }
    }

    init(cartManager: CartManagerProtocol) {
        self.cartManager = cartManager
        
        cartManager.productsPulisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] products in
                guard let self else { return }
                self.products = products
            }
            .store(in: &cancellables)
        
        cartManager.countPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] count in
                guard let self else { return }
                self.count = count
            }
            .store(in: &cancellables)
        
        cartManager.totalPricePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] price in
                guard let self else { return }
                self.totalPrice = price
                self.updateDiscount()
            }
            .store(in: &cancellables)
        
        cartManager.totalDiscountedPricePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] price in
                guard let self else { return }
                self.totalDiscountedPrice = price
                self.updateDiscount()
            }
            .store(in: &cancellables)
        
    }
    
    private func updateDiscount() {
        discount = totalPrice - totalDiscountedPrice
    }
    
    func addProduct(_ product: Product) {
        cartManager.addProduct(product)
    }
    
    func increaseCount(of product: Product) {
        cartManager.increaseCountOfItem(of: product)
    }
    
    func decreaseCount(of product: Product) {
        cartManager.decreaseCountOfItem(of: product)
    }
    
    func deleteProduct(_ product: Product) {
        cartManager.deleteProduct(product)
    }
    
    func deleteAllProducts() {
        cartManager.deleteAllProducts()
    }
    
    func toggleSelection(of product: Product) {
        cartManager.toggleSelection(for: product)
    }

    func toggleAllSelection() {
        cartManager.toggleAllSelection()
    }
    
    
}
