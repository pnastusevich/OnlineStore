import SwiftUI

final class DetailProductViewModel: ObservableObject {
    @Published private(set) var product: Product
    
    init(product: Product) {
        self.product = product
    }
}
