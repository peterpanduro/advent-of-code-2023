enum Day05 {
  static func solve(input: String) -> UInt {
    var lines =
      input
      .components(separatedBy: .newlines)
      .makeIterator()
    var seeds =
      lines
      .next()!
      .components(separatedBy: ": ")[1]
      .components(separatedBy: " ")
      .map { UInt($0)! }
    var transforms = [[UInt]]()
    lines.dropFirst(2)
    while let line = lines.next() {
      if line.isEmpty {
        seeds.transform(transforms)
        transforms = []
        lines.next()
      } else {
        transforms.append(line.components(separatedBy: " ").map { UInt($0)! })
      }
    }
    return seeds.min()!
  }
}

extension Array where Element == UInt {
  mutating func transform(_ input: [[UInt]]) {
    for (index, currentValue) in self.enumerated() {
      for transf in input {
        let (destinationStart, sourceStart, range) = (transf[0], transf[1], transf[2])
        if currentValue >= sourceStart && currentValue < sourceStart + range {
          self[index] = destinationStart + currentValue - sourceStart
          break
        }
      }
    }
  }
}

let input = try! resourceWithName("input.txt")
let result = Day05.solve(input: input)
print("Result: \(result)")
