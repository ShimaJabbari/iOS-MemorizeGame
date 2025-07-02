import SwiftUI

struct Cardify: ViewModifier{
    let isFaceUp: Bool
    func body(content: Content) -> some View {
        
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
           // Group{
                base.fill().foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                    .background(base.fill().foregroundColor(.white))
                    .overlay(content)
                
//                Pie(endAngle: .degrees(240))
//                    .opacity(0.3)
//                    .padding(5)
//                
//                Text(card.content)
//                    .font(.system(size:200))
//                    .minimumScaleFactor(0.01)
//                    .aspectRatio(1, contentMode: .fit)
//                    .padding(8)
         //   }
                .opacity(isFaceUp ? 1 : 0)
            base.fill()
                .opacity(isFaceUp ? 0 : 1)
            
        }
    }
}

extension View{
    func cardify(isFaceUp: Bool) -> some View{
        modifier(Cardify(isFaceUp: isFaceUp))
    }
    
}
