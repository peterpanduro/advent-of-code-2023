enum Day06 {
  static func solve(input: String) -> Int {
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
}

func numberOfWaysToWin(_ input: [Int]) -> Int {
    let (time, distance) = (input[0], input[1])
    return (0..<time).filter { i in i * (time - i) > distance }.count
}

let input = try! resourceWithName("input.txt")
let result = Day06.solve(input: input)
print("Result: \(result)")
