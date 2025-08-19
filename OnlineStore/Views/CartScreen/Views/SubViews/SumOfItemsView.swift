

import SwiftUI

struct SumOfItemsView: View {
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
                    
                    Text("1 товар")
                }
                
                HStack {
                    Text("Товары")
                        .font(.title3)
                    
                    Spacer()
                    
                    Text("123 $")
                        .font(.title3)
                        .bold()
                }
                
                HStack {
                    Text("Скидка")
                        .font(.title3)
                    
                    Spacer()
                    
                    Text(" - 20 $")
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
                    
                    Text("123 $")
                        .font(.title2)
                        .bold()
                }
                
                Button { } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: width - 30, height: 50)
                            .cornerRadius(10)
                        
                        Text("Перейти к оформлению")
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CartView(viewModel: CartViewModel())
}

