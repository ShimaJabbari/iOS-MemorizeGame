import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        //add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)1b"))
        }
     
    }
    
    func choose(_ card: Card){
        
    }
    
  
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card : Equatable, Identifiable, CustomDebugStringConvertible{

//        static func == (lhs: MemoryGame<CardContent>.Card, rhs: MemoryGame<CardContent>.Card) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp && lhs.isMatched == rhs.isMatched && lhs.content == rhs.content
//        }
//        
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
        
        //added this because of the identifiable
        var id: String
        
        var debugDescription: String{
            return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}
