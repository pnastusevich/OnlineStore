
import SwiftUI

struct ItemView: View {
    
    @State var isSelected: Bool = false
    var width: CGFloat
    
    var body: some View {
        HStack {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: width / 4)
            
            VStack(alignment: .leading) {
                Text("Очень нужный товар")
                
                Text("Цена в $")
                    .bold()
            }
            Spacer()
            
            Button {
                isSelected.toggle()
            } label: {
                if isSelected {
                    Image(systemName: "stop")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                } else {
                    Image(systemName: "checkmark.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
}
