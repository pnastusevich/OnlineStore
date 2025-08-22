import SwiftUI

struct GridViewCell: View {
    
    @ObservedObject private(set) var viewModel: CatalogViewModel
    let item: ProductCategory
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.mainGray)
                .cornerRadius(10)
    
            VStack {
                Spacer()
                
                ZStack {
                    Image(systemName: "basket.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .frame(width: 50)
                        .foregroundStyle(.gray)
                    
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 60)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.clear, .mainGray]),
                                           startPoint: .top,
                                           endPoint: .bottom)
                        )
                }
                
                Text("\(item.name)")
                    .foregroundStyle(.black)
                    .font(.system(size: 10))
                    .padding()
            }
        }
    }
}
