import SwiftUI

struct SelectAllView: View {
    
    @ObservedObject private(set) var viewModel: CartViewModel
    
    @State private var showingAlert: Bool = false
    
    var width: CGFloat
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: width, height: 70)
                    .cornerRadius(15)
                
                HStack {
                    Button {
                        viewModel.toggleAllSelection()
                    } label: {
                            Image(systemName: viewModel.hasSelectedProducts ? "checkmark.square.fill" : "stop")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                    }
                    
                    Text("Выбрать всё")
                    
                    Spacer()
                    
                    HStack(spacing: 15) {
                        Button { } label: {
                            Image(systemName: "arrowshape.turn.up.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.gray)
                                .background {
                                    Rectangle()
                                        .frame(width: 40, height: 40)
                                        .foregroundStyle(.secondaryGray)
                                        .cornerRadius(5)
                                }
                        }
                        
                        Button {
                            showingAlert = true
                        } label: {
                            Image(systemName: "trash")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.gray)
                                .background {
                                    Rectangle()
                                        .frame(width: 40, height: 40)
                                        .foregroundStyle(.secondaryGray)
                                        .cornerRadius(5)
                                }
                        }
                        .disabled(!viewModel.hasSelectedProducts)
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Вы точно желаете удалить выбранныe товары? Отменить данное действие будет невозможно"),
                                  primaryButton: .destructive(Text("Удалить товары"), action: {
                                viewModel.deleteAllProducts()
                            }),
                                  secondaryButton: .cancel(Text("Отмена")))
                        }
                    }
                }
                .padding()
            }
        }
    }
}
//
//#Preview {
//    CartView(viewModel: CartViewModel(cartManager: CartManager.mock))
//}
