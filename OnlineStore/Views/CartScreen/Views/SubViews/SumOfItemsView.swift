

import SwiftUI

struct SumOfItemsView: View {
    
    @ObservedObject private(set) var viewModel: CartViewModel
    var width: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(maxWidth: width, maxHeight: .infinity)
                .cornerRadius(15)
            
            VStack(spacing: 15) {
                HStack {
                    Text("Ваша корзина")
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    Text("\(viewModel.count) товар")
                }
                
                HStack {
                    Text("Товары")
                        .font(.title3)
                    
                    Spacer()
                    
                    Text("\(Int(viewModel.totalPrice)) $")
                        .font(.title3)
                        .bold()
                }
                
                HStack {
                    Text("Скидка")
                        .font(.title3)
                    
                    Spacer()
                    
                    Text("- \(Int(viewModel.discount)) $")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.green)
                }
                
                Divider()
                
                HStack {
                    Text("Общая стоимость")
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    Text(" \(Int(viewModel.totalDiscountedPrice)) $")
                        .font(.title2)
                        .bold()
                }
                
                Button { } label: {
                    Text("Перейти к оформлению")
                        .foregroundStyle(.white)
                        .bold()
                        .background {
                            Rectangle()
                                .frame(width: width - 30, height: 50)
                                .cornerRadius(10)
                        }
                }
                .padding(.vertical)
            }
            .padding()
        }
    }
}

#Preview {
    CartView(viewModel: CartViewModel(cartManager: CartManager()))
}

