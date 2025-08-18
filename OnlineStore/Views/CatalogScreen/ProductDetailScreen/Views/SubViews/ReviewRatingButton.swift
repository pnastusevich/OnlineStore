

import SwiftUI

struct ReviewRatingButton: View {
    var body: some View {
        
        HStack(spacing: 20) {
            ZStack {
                Rectangle()
                    .foregroundStyle(.gray.opacity(0.2))
                    .frame(width: 100, height: 60)
                    .cornerRadius(10)
                
                VStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        
                        Text("4.8")
                            .bold()
                    }
                    Text("45 отзывов")
                        .foregroundStyle(.gray)
                        .font(.system(size: 11))
                }
            }
            
            LazyHGrid(rows: [GridItem(.flexible())], spacing: -5) {
                ForEach(1...3, id: \.self) { id in
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.gray)
                            .frame(width: 70, height: 60)
                            .cornerRadius(10)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 2)
                            }
                        VStack {
                            Image(systemName: "ellipsis.message")
                            Text("Отзыв \(id)")
                                .font(.system(size: 12))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ReviewRatingButton()
}
