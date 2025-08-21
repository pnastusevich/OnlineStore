
import SwiftUI

struct FiltersProductList: View {
    var body: some View {
        HStack(spacing: 10) {
            Button("Фильтры") {}
                .buttonStyle(.plain)
                .font(.system(size: 16))
                .padding(5)
                .padding(.horizontal, 10)
                .background(.gray.opacity(0.4))
                .cornerRadius(7)
            
            Button("Сортировка") {}
                .buttonStyle(.plain)
                .font(.system(size: 16))
                .padding(5)
                .padding(.horizontal, 10)
                .background(.gray.opacity(0.4))
                .cornerRadius(7)
        }
    }
}
