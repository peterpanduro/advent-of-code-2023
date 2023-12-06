import XCTest
@testable import Day06
class Day05Tests: XCTestCase {
    func testSample() {
        let input = """
        Time:      7  15   30
        Distance:  9  40  200
        """
        let expectedValue: Int = 288
        let actualValue = Day06.solve(input: input)
        XCTAssertEqual(actualValue, expectedValue, "Actual value should be equal to expected value")
    }
}
