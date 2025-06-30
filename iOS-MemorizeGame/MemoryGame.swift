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
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int?
//    {
//        get { cards.indices.filter{ index in cards[index].isFaceUp }.only }
//        set { cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0) } }
//    }
//    {
//        get {
//            var faceUpCardIndicies = [Int]()
//            for index in cards.indices{
//                if cards[index].isFaceUp {
//                    faceUpCardIndicies.append(index)
//                }
//            }
//            if faceUpCardIndicies.count == 1{
//                return faceUpCardIndicies.first
//            } else {
//                return nil
//            }
//        }
//        set {
//            for index in cards.indices {
//                if index == newValue {
//                    cards[index].isFaceUp = true
//                } else {
//                    cards[index].isFaceUp = false
//                }
//            }
//        }
//    }
    
    //we can do the first if let part this way or like the 2 below commented out functions
        mutating func choose(_ card: Card){
            if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }){
                if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                    if let potentialMatchedIndex = indexOfTheOneAndOnlyFaceUpCard{
                        if cards[chosenIndex].content == cards[potentialMatchedIndex].content{
                            cards[chosenIndex].isMatched = true
                            cards[potentialMatchedIndex].isMatched = true
                        }
                        indexOfTheOneAndOnlyFaceUpCard = nil
                    }else{
                            for index in cards.indices{
                                cards[index].isFaceUp = false
                            }
                            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                        }
                        cards[chosenIndex].isFaceUp.toggle()
                    }
                }
            }
    
    
    //with these 2 functions
//    mutating func choose(_ card: Card){
//        if let chosenIndex = index(of: card){
//            cards[chosenIndex].isFaceUp.toggle()
//        }
//    }
//    private func index(of card: Card) -> Int?{
//        for index in cards.indices{
//            if(cards[index].id == card.id){
//                return index
//            }
//        }
//        return nil
//    }
    

    
    struct Card : Equatable, Identifiable, CustomDebugStringConvertible{

//        static func == (lhs: MemoryGame<CardContent>.Card, rhs: MemoryGame<CardContent>.Card) -> Bool {
//            return lhs.isFaceUp == rhs.isFaceUp && lhs.isMatched == rhs.isMatched && lhs.content == rhs.content
//        }
//        
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        
        //added this because of the identifiable
        var id: String
        
        var debugDescription: String{
            return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}

extension Array{
    var only: Element?{
        count == 1 ? first : nil
    }
}
