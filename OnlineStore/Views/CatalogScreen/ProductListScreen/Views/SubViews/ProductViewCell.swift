
import SwiftUI

struct ProductViewCell: View {

    @ObservedObject var viewModel: ProductListViewModel
    var item: Product
    var width: CGFloat
    
    var body: some View {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.clear)
                        .frame(width: width / 2, height: width / 2)
                        .background(
                            LinearGradient(gradient: Gradient(
                                           colors: [.gray.opacity(0.3), .mainGray]),
                                           startPoint: .top,
                                           endPoint: .bottom)
                        )
                        .cornerRadius(10)

                    ProductViewImageSlider(images: ["basket.fill",
                                                    "basket",
                                                    "cart.fill",
                                                    "cart"]
                    )
                }
       
                VStack(alignment: .leading) {
                    Text("\(Int(item.price + 14)) $")
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                        .strikethrough()
                    
                    Text("\(Int(item.price)) $")
                        .foregroundStyle(.black)
                        .font(.headline)
                        .bold()
                    
                    Text("\(item.title)")
                        .foregroundStyle(.black)
                        .font(.system(size: 15))
                    
                    Text("\(item.description)")
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Rectangle()
                    .fill(.clear)
                    .cornerRadius(10)
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
