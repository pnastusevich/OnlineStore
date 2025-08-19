
import SwiftUI

struct ButtonsInItem: View {
    
    @State var countOfProduct: Int = 1
    
    var body: some View {
        HStack {
            Button { } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.secondaryGray)
                        .cornerRadius(5)
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(.black)
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
                        .frame(width: 15, height: 15)
                        .foregroundStyle(.black)
                }
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 100, height: 30)
                    .foregroundStyle(.secondaryGray)
                    .cornerRadius(5)
                
                HStack(spacing: 25) {
                    Button {
                        if countOfProduct > 0 {
                            countOfProduct -= 1
                        }
                    } label: {
                            Image(systemName: "minus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(.black)
                    }
                    
                    Text("\(countOfProduct)")
                    
                    Button {
                        countOfProduct += 1
                    } label: {
                          Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(.black)
                    }
                }
            }
            
            Spacer()
            
            Button { } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 80, height: 30)
                        .foregroundStyle(.secondaryGray)
                        .cornerRadius(5)
                    
                    Text("Купить")
                }
            }
        }
        .padding()
    }
}
