

import SwiftUI

struct TitleReviewProductCell: View {
    var rating: Double
    var count: Int
    
    var body: some View {
        HStack {
            Text("Отзыва")
                .font(.title3)
                .bold()
            Text("\(count)")
                .font(.callout)
            
            Spacer()
            
            HStack(spacing: 2) {
                ForEach(1...5, id: \.self) {_ in
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
            }
            Text(formatRating(rating))
        }
    }
    
    private func formatRating(_ rating: Double) -> String {
        String(format: "%.2f", rating)
    }
}


