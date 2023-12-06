import XCTest
@testable import Day06
class Day06Tests: XCTestCase {
    func testPart1() {
        let input = """
        Time:      7  15   30
        Distance:  9  40  200
        """
        let expectedValue: Int = 288
        let actualValue = Day06.part1(input: input)
        XCTAssertEqual(actualValue, expectedValue, "Actual value should be equal to expected value")
    }

    func testPart2() {
        let input = """
        Time:      7  15   30
        Distance:  9  40  200
        """
        let expectedValue: Int = 71503
        let actualValue = Day06.part2(input: input)
        XCTAssertEqual(actualValue, expectedValue, "Actual value should be equal to expected value")
    }
}
