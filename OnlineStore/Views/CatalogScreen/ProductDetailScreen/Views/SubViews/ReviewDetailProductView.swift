import SwiftUI

struct ReviewDetailProductView: View {
    @ObservedObject private(set) var viewModel: DetailProductViewModel
    var width: CGFloat

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.mainGray)
                .cornerRadius(25)
            
                VStack {
                    HStack {
                        Text("Отзывы")
                            .font(.title3)
                            .bold()
                        Text("45")
                            .font(.callout)
                        
                        Spacer()
                        
                        LazyHGrid(rows: [GridItem(.flexible())], spacing: 2) {
                            ForEach(1...5, id: \.self) {_ in
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                            }
                        }
                        Text("4.8")
                    }
                    .padding()
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: width - 30, height: 60)
                                .foregroundStyle(.white)
                                .cornerRadius(15)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                }
                            
                            Text("Оставить отзыв")
                                .foregroundStyle(.black)
                        }
                    }
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.flexible())]) {
                        ForEach(1...10, id: \.self) { id in
                            ZStack {
                                Rectangle()
                                    .frame(width: width / 5, height: 140)
                                    .foregroundStyle(.white)
                                    .cornerRadius(15)
                                
                                VStack {
                                    Image(systemName: "person.bubble")
                                    
                                    Text("Фото отзыв \(id)")
                                        .frame(maxWidth: width)
                                        .font(.system(size: 12))
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                    }
                }
                .padding()
                .scrollIndicators(.hidden)
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.flexible())]) {
                        ForEach(1...3, id: \.self) { _ in
                            ZStack {
                                Rectangle()
                                    .frame(width: width * 0.7, height: width * 0.7)
                                    .foregroundStyle(.gray)
                                    .cornerRadius(25)
                                
                                VStack {
                                    Text("Отзыв")
                                        .frame(maxWidth: width)
                                        .font(.system(size: 12))
                                        .foregroundStyle(.white)
                                    
                                    
                                }
                            }
                        }
                    }
                }
                .padding()
                .scrollIndicators(.hidden)
            }
        }
    }
}


#Preview {
    DetailProductView(viewModel: DetailProductViewModel(product: MockModel.sample.category.first!.products.first!))
}
