
import SwiftUI

struct ItemViewCell: View {
    
    @ObservedObject private(set) var viewModel: CartViewModel
    
    @State var isSelected: Bool = false
    let item: Product
    var width: CGFloat
    
    private var finalPrice: Double {
        item.price * (1 - item.discountPercentage / 100)
    }
  
    
    var body: some View {
        HStack {
            
            ImageItemView(images: item.images)
                .frame(maxWidth: width / 4)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(item.title)")
                
                Text("\(item.description)")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .lineLimit(3)
                
                HStack {
                    Text("\(formatPrice(finalPrice * Double(item.count)))")
                        .bold()
                    Text("\(formatPrice(item.price * Double(item.count)))")
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
                Image(systemName: item.isSelectedInCart ? "checkmark.square.fill" : "stop")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            .padding(.horizontal)
        }
        .padding()
        
        ButtonsInCell(viewModel: viewModel, item: item)
    }
    
    private func formatPrice(_ price: Double) -> String {
        String(format: "%.2f $", price)
    }
}

