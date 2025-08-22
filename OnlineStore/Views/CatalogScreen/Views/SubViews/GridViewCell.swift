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
                HStack {
                    Text(item.name)
                        .foregroundStyle(.black)
                        .font(.system(size: 12))
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading], 8)
                    Spacer()
                }
                Spacer()
                
                HStack {
                    Spacer()
                    Image(item.slug)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.bottom, .trailing], 8)
                }
            }
        }
    }
}
