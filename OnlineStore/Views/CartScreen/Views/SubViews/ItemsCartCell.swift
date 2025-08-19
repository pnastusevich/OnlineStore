
import SwiftUI

struct ItemsCartCell: View {
    
    var width: CGFloat

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(maxWidth: width, maxHeight: .infinity)
                .cornerRadius(15)
            
            VStack(alignment: .leading) {
                Text("Доступны для заказа")
                    .font(.title2)
                    .bold()
                    .padding()
                
                Divider()
                
                VStack {
                    ForEach(1...2, id: \.self) { _ in
                        ItemView(width: width)
                        ButtonsInItem()
                    }
                }
      
            }
        }
    }
}

#Preview {
    CartView(viewModel: CartViewModel())
}
