import SwiftUI

struct SelectAllView: View {
    
    var width: CGFloat
    
    @State var isSelectedAll: Bool = false
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: width, height: 70)
                    .cornerRadius(15)
                
                HStack {
                    Button {
                        isSelectedAll.toggle()
                    } label: {
                        if isSelectedAll {
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
                    
                    Text("Выбрать всё")
                    
                    Spacer()
                    
                    HStack(spacing: 15) {
                        Button { } label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(.secondaryGray)
                                    .cornerRadius(5)
                                
                                Image(systemName: "arrowshape.turn.up.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(.gray)
                            }
                        }
                        
                        Button { } label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(.secondaryGray)
                                    .cornerRadius(5)
                                
                                Image(systemName: "trash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    CartView(viewModel: CartViewModel())
}
