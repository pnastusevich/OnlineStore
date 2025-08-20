

import SwiftUI

struct CartCoordinatorView: View {
    
    @StateObject private var viewModel: CartViewModel
    
    init(appFactory: AppFactory) {
        _viewModel = StateObject(wrappedValue: CartViewModel(cartManager: appFactory.cartManger))
    }
    
    var body: some View {
        CartView(viewModel: viewModel)
    }
}
