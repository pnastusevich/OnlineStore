import SwiftUI

struct CatalogView: View {
    
    @ObservedObject private(set) var viewModel: CatalogViewModel
    private let horizontalPadding: CGFloat = 8
    
    var body: some View {
        GeometryReader { geometry in
            
            let availableWidth = max(100, geometry.size.width - (horizontalPadding * 2))
            
            VStack(spacing: 0) {
                SearchView(height: geometry.size.height)
                HStack() {
                    CategoryView(viewModel: viewModel, width: availableWidth * 0.18)
                    
                    GridView(viewModel: viewModel, width: availableWidth * 0.82)
                }
                .padding(.trailing, horizontalPadding)
            }
        }
    }
}
