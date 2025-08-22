import SwiftUI

struct ReviewRatingButton: View {
    
    @ObservedObject private(set) var viewModel: DetailProductViewModel
    
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
                        
                        Text("\(formatRating(viewModel.product.rating))")
                            .bold()
                    }
                    Text("\(viewModel.product.reviews.count) отзыва")
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
    private func formatRating(_ rating: Double) -> String {
        String(format: "%.2f", rating)
    }
}

//#Preview {
//    ReviewRatingButton(viewModel: D)
//}
