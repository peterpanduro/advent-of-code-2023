enum Day07 {
  static func part1(input: String) -> UInt {
    input.components(separatedBy: .newlines)
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
      .enumerated().map { (i, v) in
        let value = UInt(v[1])
        return UInt(i + 1) * value!
      }.reduce(0, +)
  }

  static func part2(input: String) -> UInt {
    input.components(separatedBy: .newlines)
      .filter { !$0.isEmpty }
      .map { $0.components(separatedBy: .whitespaces) }
      .sorted {
        let handA = getHandValue2($0[0])
        let handB = getHandValue2($1[0])
        if handA == handB {
          for i in 0..<5 {
            let cardA = Card2(rawValue: $0[0][i])
            let cardB = Card2(rawValue: $1[0][i])
            if cardA!.value != cardB!.value {
              return cardA!.value > cardB!.value
            }
          }
        }
        return handA > handB
      }
      .reversed()
      .enumerated().map { (i, v) in
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

func getHandValue2(_ hand: String) -> Int {
  var temp =
    hand
    .compactMap { Card2(rawValue: $0)?.value }
    .sorted { $0 > $1 }
    .reduce(into: [:]) { counts, number in
      counts[number, default: 0] += 1
    }
    .sorted { $0.value > $1.value }
  let jokers = temp.removeAll { $0.key == 1 }.first?.value ?? 0
  let matches = temp.map { $0.value }

  // 5 = 6
  // 4 = 5
  // 3 + 2 = 4
  // 3 = 3
  // 2 + 2 = 2
  // 2 = 1
  // 1 = 0
  if jokers == 5 {
    return 6
  }
  let a = matches[0]
  if a + jokers == 5 {
    return 6
  }
  if a + jokers == 4 {
    return 5
  }

  if jokers == 2 {
    if a == 2 {
      return 5
    }
    return 3
  }

  let b = matches[1]

  if jokers == 1 {
    if a == 3 {
      return 5
    }
    if a == 2 && b == 2 {
      return 4
    }
    if a == 2 {
      return 3
    }
    return 1
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
  if a == 2 {
    return 1
  }
  return 0
}

extension String {
  subscript(i: Int) -> Character {
    return self[index(startIndex, offsetBy: i)]
  }
}

extension Array {
  mutating func removeAll(where predicate: (Element) throws -> Bool) rethrows -> [Element] {
    var removed: [Element] = []
    for (index, element) in self.enumerated().reversed() where try predicate(element) {
      removed.append(element)
      self.remove(at: index)
    }
    return removed
  }
}

let input = try! resourceWithName("input.txt")
let part1 = Day07.part1(input: input)
print("Part 1: \(part1)")
let part2 = Day07.part2(input: input)
print("Part 2: \(part2)")
