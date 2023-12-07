enum Day07 {
  static func part1(input: String) -> UInt {
    let hands = input.components(separatedBy: .newlines)
      .filter { !$0.isEmpty }
      .map { $0.components(separatedBy: .whitespaces) }
      .sorted {
        let handA = getHandValue($0[0])
        let handB = getHandValue($1[0])
        if handA == handB {
          for i in 0..<5 {
            let cardA = Card(rawValue: $0[0][i])
            let cardB = Card(rawValue: $1[0][i])
            if cardA!.value != cardB!.value {
              return cardA!.value > cardB!.value
            }
          }
        }
        return handA > handB
      }
      .reversed()
      return hands.enumerated().map { (i, v) in
        let value = UInt(v[1])
        return UInt(i + 1) * value!
      }.reduce(0, +)
  }
}

func getHandValue(_ hand: String) -> Int {
  let matches =
    hand
    .compactMap { Card(rawValue: $0)?.value }
    .sorted { $0 > $1 }
    .reduce(into: [:]) { counts, number in
      counts[number, default: 0] += 1
    }
    .sorted { $0.value > $1.value }
    .map { $0.value }

  let a = matches[0]
  if a == 5 {
    return 6
  }
  let b = matches[1]
  if a == 4 {
    return 5
  }
  if a == 3 && b == 2 {
    return 4
  }
  if a == 3 {
    return 3
  }
  if a == 2 && b == 2 {
    return 2
  }
  if a == 2 && b == 1 {
    return 1
  }
  return 0
}

extension String {
   subscript(i: Int) -> Character {
       return self[index(startIndex, offsetBy: i)]
   }
}

let input = try! resourceWithName("input.txt")
let part1 = Day07.part1(input: input)
print("Part 1: \(part1)")
