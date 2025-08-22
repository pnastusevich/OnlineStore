
import SwiftUI

struct PromoDetailProductView: View {
    
    @ObservedObject private(set) var viewModel: DetailProductViewModel
    var width: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.mainGray)
                .cornerRadius(25)
            
            VStack(alignment: .leading) {
                DetailProductImageSlider(images: viewModel.product.images)
                    .frame(width: width, height: width)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("ЛУЧШАЯ ЦЕНА")
                        .foregroundStyle(.white)
                        .padding(7)
                        .font(.system(size: 11))
                        .bold()
                        .background(.blue)
                        .cornerRadius(15)
                    
                    Text("\(viewModel.product.title)")
                        .font(.headline)
                    
                    Text("Артикул: \(viewModel.product.id)")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                    
                    Button {
                        
                    } label: {
                        ReviewRatingButton()
                    }
                    .buttonStyle(.plain)
                }
                .padding()
            }
        }
    }
}
