import Foundation

enum Color{
    case red
    case blue
    case green
}

struct Card{
    var color: Color
    var roll : Int

    init(color:Color ) {
        self.color = color

        switch color {
            case .blue:
                self.roll = Int.random(in: 1...2)

            case .red:
                self.roll = Int.random(in: 3...4)

            case .green:
                self.roll = Int.random(in: 4...5)
            
        default:
            fatalError("Unsupported")
        }
    }
}

class Deck{
   var cardDeck:[Card]

   init() {
    var card: [Card] = []
    for _ in 1...10 {
        let cardblue = Card(color: .blue)
        let cardRed = Card(color: .red)
        let cardgreen = Card(color: .green)
        card.append(cardblue)
        card.append(cardRed)
        card.append(cardgreen) 
    }
    self.cardDeck = card
   }

   func draw() -> Card {
       if cardDeck.isEmpty{
           print("no more cards")
       }

       return cardDeck.removeFirst()
   }

   func isEmpty() -> Bool {
       return cardDeck.isEmpty
   }

  func shuffle () {
      cardDeck.shuffle()
  }
}



class Player{
    let name: String
    var holdOfhand:[Card]
 
 init(name: String) {
     self.name = name
     self.holdOfhand = []
 }
 
 func drawForm (deck: Deck)-> Card {
    let drawCard = deck.draw()
    holdOfhand.append(drawCard)
    return drawCard
   }

  func rollDice () -> Int {
      return Int.random(in: 1...6)
  }

  func matchingCards(color: Color, roll: Int) -> Int {
      var count = 0
      for card in self.holdOfhand {
          if card.roll == roll && card.color == color {
              count += 1
          }
      }
      return count
  }
}






