

import SwiftUI

struct TitleReviewProductCell: View {
    var body: some View {
        HStack {
            Text("Отзывы")
                .font(.title3)
                .bold()
            Text("45")
                .font(.callout)
            
            Spacer()
            
            HStack(spacing: 2) {
                ForEach(1...5, id: \.self) {_ in
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
            }
            Text("4.8")
        }
    }
}


