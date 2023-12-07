import XCTest
@testable import Day07
class Day07Tests: XCTestCase {
    func testPart1() {
        let input = """
        32T3K 765
        T55J5 684
        KK677 28
        KTJJT 220
        QQQJA 483
        """
        let expectedValue: UInt = 6440
        let actualValue = Day07.part1(input: input)
        XCTAssertEqual(actualValue, expectedValue, "Actual value should be equal to expected value")
    }

    // func testPart2() {
    //     let input = """
    //     Time:      7  15   30
    //     Distance:  9  40  200
    //     """
    //     let expectedValue: Int = 71503
    //     let actualValue = Day06.part2(input: input)
    //     XCTAssertEqual(actualValue, expectedValue, "Actual value should be equal to expected value")
    // }
}
