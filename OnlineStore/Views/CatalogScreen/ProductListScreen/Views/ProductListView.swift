
import SwiftUI

struct ProductListView: View {
    
    @ObservedObject private(set) var viewModel: ProductListViewModel
    @State private var headerHeight: CGFloat = 50
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let horizontalPadding: CGFloat = 16
    private let minHeaderHeight: CGFloat = 0
    private let maxHeaderHeight: CGFloat = 50
    
    @State private var scrollY: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            let availableWidth = max(0, geometry.size.width - (horizontalPadding * 3))
            
            VStack(alignment: .leading, spacing: 0) {
                ProductListTitleView(nameCategory: viewModel.item.name,
                                     countProducts: viewModel.item.products.count
                )
                .frame(height: headerHeight)
                .clipped()
                .opacity(headerHeight == 0 ? 0 : 1)
                .animation(.easeInOut(duration: 0.5),
                           value: headerHeight
                )
               
                FiltersProductListView()
                    .padding(.horizontal)
                    .padding(.vertical, 10)
              
                TrackingScrollView(offsetY: $scrollY) {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.item.products, id: \.self) { product in
                            Button {
                                viewModel.didSelectProduct(product)
                            } label: {
                                ProductViewCell(
                                    viewModel: viewModel,
                                    item: product,
                                    width: max(50, availableWidth)
                                )
                            }
                        }
                    }
                    .padding(.horizontal, horizontalPadding)
                    .padding(.top, 8)
                    .padding(.bottom, 16)
                }
                .onChange(of: scrollY) { y in
                    let delta = max(0, min(maxHeaderHeight, y))
                    headerHeight = max(maxHeaderHeight - delta, minHeaderHeight)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        ProductListSearchView()
                    }
                }
            }
        }
    }
}

#Preview {
    ProductListView(viewModel:
                        ProductListViewModel(item: MockModel.sample.category.first!,
                                             coordinator: CatalogCoordinator(appFactory: AppFactory())),
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ])
}
