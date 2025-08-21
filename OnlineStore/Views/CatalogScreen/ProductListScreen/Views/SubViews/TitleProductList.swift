

import SwiftUI

struct TitleProductList: View {
    var nameCategory: String
    var countProducts: Int

    var body: some View {
        HStack(alignment: .center) {
            Text("\(nameCategory)")
                .font(.title3)
                .bold()
            
            Text("\(countProducts) товаров")
                .font(.system(.footnote))
                .foregroundStyle(.gray)
        }
        .padding()
    }
}
