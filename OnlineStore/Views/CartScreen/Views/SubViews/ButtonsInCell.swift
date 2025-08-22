
import SwiftUI

struct ButtonsInCell: View {
    @ObservedObject private(set) var viewModel: CartViewModel
    
    let item: Product
    @State private var showingAlert = false
    
    var body: some View {
        HStack() {
            Button { } label: {
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.black)
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
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.black)
                    .background {
                        Rectangle()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.secondaryGray)
                            .cornerRadius(5)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Вы точно желаете удалить выбранный товар? Отменить данное действие будет невозможно"),
                              primaryButton: .destructive(Text("Удалить товар"), action: {
                            viewModel.deleteProduct(item)
                        }),
                              secondaryButton: .cancel(Text("Отмена")))
                    }
            }.padding(.horizontal)
            
            ZStack {
                Rectangle()
                    .frame(width: 100, height: 40)
                    .foregroundStyle(.secondaryGray)
                    .cornerRadius(5)
                
                HStack(spacing: 25) {
                    Button {
                        if item.count > 1 {
                            viewModel.decreaseCount(of: item)
                        } else if item.count == 1 {
                            showingAlert = true
                        }
                    } label: {
                            Image(systemName: "minus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.black)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Вы точно желаете удалить выбранный товар? Отменить данное действие будет невозможно"),
                              primaryButton: .destructive(Text("Удалить товар"), action: {
                            viewModel.deleteProduct(item)
                        }),
                              secondaryButton: .cancel(Text("Отмена"), action: {
                            showingAlert = false
                        }))
                    }
                    
                    Text("\(item.count)")
                    
                    Button {
                        viewModel.increaseCount(of: item)
                    } label: {
                          Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.black)
                    }
                }
            }
            
            Spacer()
            
            Button { } label: {
                Text("Купить")
                    .background {
                        Rectangle()
                            .frame(width: 80, height: 40)
                            .foregroundStyle(.secondaryGray)
                            .cornerRadius(5)
                    }
            }.padding(.horizontal)
        }
        .padding()
    }
}
//#Preview {
//    CartView(viewModel: CartViewModel(cartManager: CartManager.mock))
//}
