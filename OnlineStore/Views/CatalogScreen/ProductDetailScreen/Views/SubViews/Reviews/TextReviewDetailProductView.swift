

import SwiftUI

struct TextReviewDetailProductView: View {
    
    var reviews: [Review]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(reviews, id: \.self) { review in
                    ZStack(alignment: .top) {
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .foregroundStyle(.gray.opacity(0.2))
                            .cornerRadius(15)
                        
                        VStack(alignment: .leading) {
                            HStack(spacing: 15) {
                                Text("\(review.reviewerName)")
                                
                                Spacer()
                                
                                HStack(spacing: 0) {
                                    ForEach(1...5, id: \.self) {_ in
                                        Image(systemName: "star.fill")
                                            .foregroundStyle(.yellow)
                                    }
                                }
                            }
                            
                            
                            Text("\(review.formattedDate)")
                                .foregroundStyle(.gray)
                                .font(.system(size: 16))
                                .padding(.vertical, 4)
                                
                            
                            Text("\(review.comment)")
                                .padding(.vertical)
                        }
                        .padding()
                    }
                }
            }
        }
        .frame(height: 200)
    }
}
