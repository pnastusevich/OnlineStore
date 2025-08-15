
import SwiftUI

struct CategoryView: View {
    
    @ObservedObject private(set) var viewModel: CatalogViewModel
    
    var width: CGFloat
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible())], alignment: .center, spacing: 0) {
                
                categoryButton(
                    title: "Все категории",
                    isSelected: viewModel.selectedCategory == nil
                ) {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        viewModel.selectCategory(nil)
                    }
                }
                
                ForEach(viewModel.categories) { category in
                    categoryButton(
                        title: category.name,
                        isSelected: viewModel.selectedCategory == category
                    ) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            viewModel.selectCategory(category)
                        }
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(width: width)
    }
    
    @ViewBuilder
    private func categoryButton(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(isSelected ? Color.blue : Color.clear)
                    .frame(width: 5, height: width)
                    .animation(.easeInOut(duration: 0.2), value: isSelected)
                
                    Rectangle()
                        .fill(isSelected ? Color.clear : Color.gray.opacity(0.1))
                        .frame(width: width, height: width)
                    
                    Text(title)
                        .foregroundColor(.black)
                        .font(.system(size: 10))
                        .multilineTextAlignment(.center)
                        .padding(4)
                        .frame(width: width, height: width)
            }
        }
        .buttonStyle(.plain)
    }
}
