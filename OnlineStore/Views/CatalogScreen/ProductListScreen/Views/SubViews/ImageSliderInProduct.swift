
import SwiftUI

struct ImageSliderInProduct: View {
    
    let images: [String]
    @State private var currentIndex = 0
    
    var body: some View {
        
        TabView(selection: $currentIndex) {
            ForEach(0..<images.count, id: \.self) { index in
                Image(systemName: images[index])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .foregroundStyle(.gray)
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    ImageSliderInProduct(images: ["basket.fill", "basket", "cart.fill", "cart"])
}
