
import SwiftUI
struct PriceDetailProductView: View {
    
    @ObservedObject private(set) var viewModel: DetailProductViewModel
    var width: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.mainGray)
                .cornerRadius(25)
            
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("\(Int(viewModel.product.price) + 20) $")
                            .foregroundStyle(.gray)
                            .font(.system(size: 19))
                            .strikethrough()
                        
                        Text("- \(Int( ((viewModel.product.price + 20) - (viewModel.product.price)) / (viewModel.product.price + 20) * 100)) %")
                            .foregroundStyle(.red)
                            .font(.system(size: 14))
                            .bold()
                    }
                    
                    Text("\(Int(viewModel.product.price)) $")
                        .font(.system(size: 25))
                        .bold()
                    
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: max(width - 30, 100), height: 60)
                                .cornerRadius(10)
                            Text("Войдите, чтобы накопить бонусы")
                                .foregroundStyle(.white)
                                .font(.system(size: 15))
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Button {
                        
                    } label: {
                        
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.gray)
                                .frame(width: max(width - 30, 100), height: 60)
                                .cornerRadius(10)
                            
                            Text("Оплата по частям")
                                .foregroundStyle(.white)
                                .font(.system(size: 15))
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
    }
}

#Preview {
    DetailProductView(viewModel: DetailProductViewModel(product: MockModel.sample.category.first!.products.first!, cartManager: CartManager()))
}
