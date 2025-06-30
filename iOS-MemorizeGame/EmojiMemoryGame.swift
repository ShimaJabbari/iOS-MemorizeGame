import SwiftUI

//func creatCardContent(forPairAtIndex index: Int) -> String{
//    return ["🍫", "🍭", "🍧", "🍰", "🍩", "🍦", "🥐", "🧇", "🍉", "🍯", "🍮", "🍡"][index]
//}

class EmojiMemoryGame: ObservableObject{
    private static let emojis =  ["🍫", "🍭", "🍧", "🍰", "🍩", "🍦", "🥐", "🧇", "🍉", "🍯", "🍮", "🍡"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 12){ pairIndex in
            
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            }else{
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
//    private var model: MemoryGame<String> = MemoryGame<String>(
//        numberOfPairsOfCards: 6, cardContentFactory: { pairIndex in
//            return emojis[pairIndex]
//        })
    
    //Mark: - Intent
    
    func shuffle(){
        model.shuffle()
    }
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
