import SwiftUI

struct ReviewDetailProductView: View {
    @ObservedObject private(set) var viewModel: DetailProductViewModel
    var width: CGFloat
    
    var body: some View {
            ZStack(alignment: .top) {
                Rectangle()
                    .foregroundStyle(.mainGray)
                    .cornerRadius(15)
                
                VStack(spacing: 20) {
                    TitleReviewProductCell()
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: width - 30,  height: 50)
                                .foregroundStyle(.white)
                                .cornerRadius(15)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                }
                            
                            Text("Оставить отзыв")
                                .foregroundStyle(.black)
                        }
                    }
                    
                    PhotosReviewDetailProductView()
                    
                    TextReviewDetailProductView()
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: width - 30,  height: 50)
                                .foregroundStyle(.white)
                                .cornerRadius(15)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                }
                            
                            Text("Все отзывы")
                        }
                    }
                }
                .padding()
            
        }
    }
}
