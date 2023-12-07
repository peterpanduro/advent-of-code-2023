public enum Card2: String {
   case joker = "J"
   case two = "2"
   case three = "3"
   case four = "4"
   case five = "5"
   case six = "6"
   case seven = "7"
   case eight = "8"
   case nine = "9"
   case ten = "T"
   case queen = "Q"
   case king = "K"
   case ace = "A"

   var value: Int {
       switch self {
       case .joker:
           return 1
       case .two:
           return 2
       case .three:
           return 3
       case .four:
           return 4
       case .five:
           return 5
       case .six:
           return 6
       case .seven:
           return 7
       case .eight:
           return 8
       case .nine:
           return 9
       case .ten:
           return 10
       case .queen:
           return 12
       case .king:
           return 13
       case .ace:
           return 14
       }
   }

   public init?(rawValue: Character) {
       switch rawValue {
       case "J":
           self = .joker
       case "2":
           self = .two
       case "3":
           self = .three
       case "4":
           self = .four
       case "5":
           self = .five
       case "6":
           self = .six
       case "7":
           self = .seven
       case "8":
           self = .eight
       case "9":
           self = .nine
       case "T":
           self = .ten
       case "Q":
           self = .queen
       case "K":
           self = .king
       case "A":
           self = .ace
       default:
           return nil
       }
   }
}
