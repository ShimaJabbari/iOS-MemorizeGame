import SwiftUI

struct CardView: View{
//    let content: String
//    @State var isFaceUp: Bool = true
    let card: MemoryGame<String>.Card
    typealias Card = MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(0.3)
            .padding(5)
            .overlay(
        
        Text(card.content)
            .font(.system(size:200))
            .minimumScaleFactor(0.01)
            .aspectRatio(1, contentMode: .fit)
            .padding(8)
            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
            .animation((.easeInOut(duration: 2)), value: card.isMatched)
            
            )
            .modifier(Cardify(isFaceUp: card.isFaceUp))
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
//        .onTapGesture {
//            isFaceUp.toggle()
//        }
    }
 
}
