import SwiftUI

struct DetailProductView: View {
    
    @ObservedObject private(set) var viewModel: DetailProductViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                
                ZStack {
                    Rectangle()
                        .fill(.mainGray)
                        .cornerRadius(25)
                    
                    VStack(alignment: .leading) {
                        DetailProductImageSlider(images: ["book1", "book2", "book3", "book4"])
                            .frame(width: geometry.size.width, height: geometry.size.width)
                        
                        VStack(spacing: 5) {
                            Text("\(viewModel.product.title)")
                                .font(.headline)
                            
                            Text("Артикул: \(viewModel.product.id)")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                            
                            Button {
                                
                            } label: {
                                ReviewRatingButton()
                            }
                        }
                        .padding()
                        
                    }
                }
            }
        }
    }
    
    
}

#Preview {
    DetailProductView(viewModel: DetailProductViewModel(product: MockModel.sample.category.first!.products.first!))
}


