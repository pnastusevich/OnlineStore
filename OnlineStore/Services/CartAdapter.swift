
import SwiftUI
import Combine

final class CartAdapter: ObservableObject {
    private let cartManager: CartManagerProtocol
    
    @Published var count: Int = 0
    
    private var cancellables = Set<AnyCancellable>()
    
    init(cartManager: CartManagerProtocol) {
        self.cartManager = cartManager
        
        cartManager.countPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                self?.count = value
            }
            .store(in: &cancellables)
    }
}
