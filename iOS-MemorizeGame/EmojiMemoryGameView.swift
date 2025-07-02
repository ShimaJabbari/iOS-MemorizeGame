import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
//    let emojies: Array<String> = ["🍫", "🍭", "🍧", "🍰", "🍩", "🍦", "🥐", "🧇", "🍉", "🍯", "🍮", "🍡"]
//    @State var  cardCount: Int = 4
    var body: some View {
        VStack{
            ScrollView{
                cards
//                    .animation(.default, value: viewModel.cards)
            }
            HStack{
                Text("Score: \(viewModel.score)")
                    .animation(nil)
                Spacer()
                Button("Shuffle"){
                    withAnimation{
                        viewModel.shuffle()
                    }
                }
                
            }

//            Spacer()
//            cardAdjuster
            }
            .padding()

        }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards){ card in
                  CardView(card)
                    .aspectRatio(aspectRatio, contentMode: .fit)
                      .padding(spacing)
                      .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                      .onTapGesture {
                          withAnimation (.easeInOut(duration: 1)){
                              viewModel.choose(card)
                          }
                      }
              }

            
//            ForEach(viewModel.cards.indices, id:\.self){ index in
//                CardView(viewModel.cards[index])
//                    .aspectRatio(2/3, contentMode: .fit)
//                    .padding(4)
//            }
           }
        .foregroundColor(.teal)
    }
//    var cardRemover: some View{
//        Button(action:{
//            if (cardCount > 1){
//                cardCount-=1
//            }
//
//        },label: {
//            Image(systemName: "rectangle.stack.badge.minus.fill")
//        })
//    }
//    var cardAdder: some View{
//        Button(action:{
//            if(cardCount < emojies.count){
//                cardCount+=1
//            }
//        },label: {
//            Image(systemName: "rectangle.stack.badge.plus.fill")
//        })
//    }
//    var cardAdjuster: some View{
//        HStack{
//            cardRemover
//            Spacer()
//            cardAdder
//        } .imageScale(.large)
//    }
    
}


private func scoreChange(causedBy card: MemoryGame<String>.Card)->Int{
    return 0
}



#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

