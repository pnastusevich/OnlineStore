

import SwiftUI

struct GridView: View {
    
    @ObservedObject private(set) var viewModel: CatalogViewModel
    
    var width: CGFloat
            
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        ScrollView() {
            VStack(alignment: .leading,  spacing: 20) {
                Spacer()
                HeaderView(title: viewModel.selectedCategory?.name, image: "category")
                
                Spacer()
                Text("КАТЕГОРИЯ")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(viewModel.displayedCategories, id: \.self) { item in
                        Button {
                            viewModel.didSelectItem(category: item)
                        } label: {
                            GridViewCell(viewModel: viewModel, item: item)
                                .frame(width: max(width / 3 - 5, 50), height: max(width / 3 - 5, 50))
                        }
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(width: width)
    }
}
