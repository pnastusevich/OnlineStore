

import SwiftUI

struct CartCoordinatorView: View {
    
    @StateObject private var viewModel = CartViewModel()
    
    var body: some View {
        CartView(viewModel: viewModel)
    }
}
