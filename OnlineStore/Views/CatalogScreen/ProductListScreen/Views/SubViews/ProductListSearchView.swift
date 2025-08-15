
import SwiftUI

struct ProductListSearchView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        
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
            .padding(.horizontal)
        }
}
