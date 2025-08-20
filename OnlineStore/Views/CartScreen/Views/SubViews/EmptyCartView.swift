import SwiftUI

struct EmptyCartView: View {

    
    var body: some View {
        
        ZStack(alignment: .top) {
            Rectangle()
                .fill(.mainGray)
                
            VStack(spacing: 15) {
                Text("Корзина пуста")
                    .font(.title2)
                    .bold()
                
                Text("Перейдите в каталог или воспользуйтесь поиском, чтобы найти всё, что нужно")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                
                
                Button { } label: {
                    Text("Начать покупки")
                        .font(.system(size: 13))
                        .bold()
                        .foregroundStyle(.white)
                        .padding(10)
                        .background {
                            Rectangle()
                                .foregroundStyle(.blue.opacity(0.9))
                                .cornerRadius(10)
                        }
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    EmptyCartView()
}
