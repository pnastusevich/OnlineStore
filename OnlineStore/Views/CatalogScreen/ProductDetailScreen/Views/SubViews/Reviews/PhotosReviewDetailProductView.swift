
import SwiftUI

struct PhotosReviewDetailProductView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())]) {
                ForEach(1...10, id: \.self) { id in
                    ZStack {
                        Rectangle()
                            .frame(width: 70, height: 140)
                            .foregroundStyle(.white)
                            .cornerRadius(15)
                        
                        VStack {
                            Image(systemName: "person.bubble")
                            
                            Text("Фото отзыв \(id)")
                                .frame(maxWidth: 70)
                                .font(.system(size: 12))
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
        }
        .frame(height: 140)
    }
}
