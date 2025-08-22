import SwiftUI
struct ImageItemView: View {
    
    let images: [String]
    @State private var currentIndex = 0
    
    var body: some View {
        
        TabView(selection: $currentIndex) {
            ForEach(0..<images.count, id: \.self) { index in
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(
                            colors: [.gray.opacity(0.3), .mainGray]),
                                             startPoint: .top,
                                             endPoint: .bottom))
                    
                    AsyncImage(url: URL(string: images[index])) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                .scaleEffect(1.5)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .clipped()
                        case .failure(_):
                            Image(systemName: "Photo")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .tag(index)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}
