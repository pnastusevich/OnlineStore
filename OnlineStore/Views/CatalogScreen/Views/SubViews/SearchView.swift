
import SwiftUI

struct SearchView: View {
    
    @State private var searchText: String = ""
    private(set) var height: CGFloat
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(height: height / 10)
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 7)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                
                TextField("Поиск по каталогу", text: $searchText)
                    .textFieldStyle(.plain)
                    .padding(.vertical, 8)
            }
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.mainGray)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            }
            .padding()
        }
    }
}
