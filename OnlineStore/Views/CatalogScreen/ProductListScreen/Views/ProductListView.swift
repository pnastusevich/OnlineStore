
import SwiftUI

struct ProductListView: View {
    
    @ObservedObject private(set) var viewModel: ProductListViewModel
    @State private var headerHeight: CGFloat = 50
    @State private var scrollOffset: CGFloat = 0
    
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let horizontalPadding: CGFloat = 16
    private let minHeaderHeight: CGFloat = 0
    private let maxHeaderHeight: CGFloat = 50
    
    var body: some View {
        let cellWidth = (UIScreen.main.bounds.width - horizontalPadding * 3) / 2
        
        VStack(alignment: .leading, spacing: 0) {
            TitleProductList(nameCategory: viewModel.category.name,
                             countProducts: viewModel.productsByCategory.count
            )
            .frame(height: headerHeight)
            .clipped()
            .opacity(headerHeight == 0 ? 0 : 1)
            .animation(.easeInOut(duration: 0.3),
                       value: headerHeight
            )
            
            FiltersProductList()
                .padding(.horizontal)
                .padding(.vertical, 10)
            
            ScrollView {
                VStack(spacing: 0) {
                    GeometryReader { geo -> Color in
                        let offset = geo.frame(in: .named("scroll")).minY
                        DispatchQueue.main.async {
                            let delta = -offset
                            let progress = min(max(delta / maxHeaderHeight, 0), 1)
                            headerHeight = maxHeaderHeight * (1 - progress)
                        }
                        return Color.clear
                    }
                    .frame(height: 0)
                    
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.productsByCategory, id: \.self) { product in
                            ProductCell(
                                viewModel: viewModel,
                                product: product,
                                width: cellWidth
                            )
                            .padding(.bottom, 16)
                            .onTapGesture {
                                viewModel.didSelectProduct(product)
                            }
                        }
                    }
                    .padding(.horizontal, horizontalPadding)
                    .padding(.top, 8)
                    .padding(.bottom, 16)
                }
            }
            .coordinateSpace(name: "scroll")
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    SearchProductList()
                }
            }
        }
    }
}

