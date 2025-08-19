

import SwiftUI

struct TextReviewDetailProductView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(1...3, id: \.self) { _ in
                    ZStack(alignment: .top) {
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .foregroundStyle(.gray.opacity(0.2))
                            .cornerRadius(15)
                        
                        VStack(alignment: .leading) {
                            HStack(spacing: 15) {
                                Text("Сергей")
                                
                                Spacer()
                                
                                HStack(spacing: 0) {
                                    ForEach(1...5, id: \.self) {_ in
                                        Image(systemName: "star.fill")
                                            .foregroundStyle(.yellow)
                                    }
                                }
                            }
                            
                            
                            
                            Text("30 июля 2025")
                                .foregroundStyle(.gray)
                                .font(.system(size: 16))
                                .padding(.vertical, 4)
                            
                            Text("Крутой товар")
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
