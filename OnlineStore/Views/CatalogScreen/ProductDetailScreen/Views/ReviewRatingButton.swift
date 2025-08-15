

import SwiftUI

struct ReviewRatingButton: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.gray.opacity(0.3))
                .frame(maxWidth: 100, maxHeight: 60)
                .cornerRadius(15)
            
            
        }
    }
}

#Preview {
    ReviewRatingButton()
}
