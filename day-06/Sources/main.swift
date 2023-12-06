enum Day06 {
  static func part1(input: String) -> Int {
    input
      .components(separatedBy: .newlines)
      .filter { !$0.isEmpty }
      .map {
        $0.split(separator: " ")
          .dropFirst()
          .compactMap { Int($0) }
      }
      .reduce([]) {
        $0.isEmpty
          ? $1.map { [$0] }
          : zip($0, $1)
            .map { $0.0 + [$0.1] }
      }
      .map { numberOfWaysToWin($0) }.reduce(1, *)
  }

  static func part2(input: String) -> Int {
    let array =
      input
      .components(separatedBy: .newlines)
      .filter { !$0.isEmpty }
      .map {
        $0.trimmingCharacters(in: .whitespaces)
          .split(separator: ":")
          .dropFirst()
          .map { $0.replacingOccurrences(of: " ", with: "") }
      }
      .flatMap { $0 }
      .map { Int($0)! }
    let result = numberOfWaysToWin(array)
    return result
  }
}

func numberOfWaysToWin(_ input: [Int]) -> Int {
  let (time, distance) = (input[0], input[1])
  return (0..<time).filter { i in i * (time - i) > distance }.count
}

let input = try! resourceWithName("input.txt")
// let sample = try! resourceWithName("sample.txt")
let part1 = Day06.part1(input: input)
print("Part 1: \(part1)")
let part2 = Day06.part2(input: input)
print("Part 2: \(part2)")
