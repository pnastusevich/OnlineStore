
import SwiftUI

struct HeaderView: View {
    
    var title: String?
    var image: String
    
    var body: some View {
        
        ZStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .cornerRadius(15)
            
            VStack() {
                Spacer()
                Rectangle()
                    .fill(.clear)
                    .frame(height: 70)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.clear, .white]),
                                       startPoint: .top,
                                       endPoint: .bottom)
                    )
            }
            
            VStack() {
                Spacer()
                Text(title ?? "Все категории")
                    .foregroundStyle(.black)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .bottom)
            }
        }
        .frame(width: 200, height: 100)
    }
}


#Preview {
    HeaderView(title: "Все категории", image: "category")
}
