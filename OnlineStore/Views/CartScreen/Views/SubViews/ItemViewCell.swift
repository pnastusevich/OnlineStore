
import SwiftUI

struct ItemViewCell: View {
    
    @ObservedObject private(set) var viewModel: CartViewModel
    
    @State var isSelected: Bool = false
    let item: Product
    var width: CGFloat
    
    var body: some View {
        HStack {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: width / 4)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(item.title)")
                
                Text("\(item.description)")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                
                HStack {
                    Text("\(Int(item.discountedPrice) * item.count) $")
                        .bold()
                    Text("\(Int(item.price) * item.count) $")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                        .strikethrough()
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button {
                viewModel.toggleSelection(of: item)
            } label: {
                Image(systemName: item.isSelected ? "checkmark.square.fill" : "stop")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            .padding(.horizontal)
        }
        .padding()
        
        ButtonsInCell(viewModel: viewModel, item: item)
    }
}

#Preview {
    CartView(viewModel: CartViewModel(cartManager: CartManager.mock))
}
