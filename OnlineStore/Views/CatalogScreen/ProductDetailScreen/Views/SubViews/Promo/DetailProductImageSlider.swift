

import SwiftUI

struct DetailProductImageSlider: View {
    
    let images: [String]
    @State private var currentIndex = 0
    
    var body: some View {
        
        TabView(selection: $currentIndex) {
            ForEach(0..<images.count, id: \.self) { index in
                
                ZStack {
                    Rectangle()
                        .fill(.mainGray)
                    VStack {
                        Image(images[index])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200)
                            .foregroundStyle(.gray)
                            .tag(index)
                        Rectangle()
                            .fill(.mainGray)
                            .frame(maxHeight: 50)
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    DetailProductImageSlider(images: ["book1", "book2", "book3", "book4"])
}

