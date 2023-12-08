enum Day08 {
  static func part1(input: String) -> UInt {
    let lines = input.components(separatedBy: .newlines).compactMap { $0.isEmpty ? nil : $0 }
    let instructions = lines[0]
    let table = lines[1...].reduce(into: [String: [String]]()) { (result, line) in
      let parts = line.components(separatedBy: " = ")
      let part2 = parts[1].replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").split(
        separator: ","
      ).map { $0.trimmingCharacters(in: .whitespaces) }
      result[parts[0]] = part2
    }

    var iterations: UInt = 0;
    var currentRegister = "AAA"
    while currentRegister != "ZZZ" {
      for char in instructions {
        iterations += 1
        let lookupIndex = char == "L" ? 0 : 1
        currentRegister = table[currentRegister]![lookupIndex]
        if currentRegister == "ZZZ" {
          break
        }
      }
    }
    return iterations
  }
}

let input = try! resourceWithName("input.txt")
let part1 = Day08.part1(input: input)
print("Part 1: \(part1)")
