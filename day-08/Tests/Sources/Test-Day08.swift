import XCTest
@testable import Day08
class Day08Tests: XCTestCase {
    func testPart1() {
        let input = """
        RL
        
        AAA = (BBB, CCC)
        BBB = (DDD, EEE)
        CCC = (ZZZ, GGG)
        DDD = (DDD, DDD)
        EEE = (EEE, EEE)
        GGG = (GGG, GGG)
        ZZZ = (ZZZ, ZZZ)
        """
        let expectedValue: UInt = 2
        let actualValue = Day08.part1(input: input)
        XCTAssertEqual(actualValue, expectedValue, "Actual value should be equal to expected value")
    }

    func testPart1_2() {
        let input = """
        LLR

        AAA = (BBB, BBB)
        BBB = (AAA, ZZZ)
        ZZZ = (ZZZ, ZZZ)
        """
        let expectedValue: UInt = 6
        let actualValue = Day08.part1(input: input)
        XCTAssertEqual(actualValue, expectedValue, "Actual value should be equal to expected value")
    }


    // func testPart2() {
    //     let input = """
    //     RL
    //     
    //     AAA = (BBB, CCC)
    //     BBB = (DDD, EEE)
    //     CCC = (ZZZ, GGG)
    //     DDD = (DDD, DDD)
    //     EEE = (EEE, EEE)
    //     GGG = (GGG, GGG)
    //     ZZZ = (ZZZ, ZZZ)
    //     """
    //     let expectedValue: UInt = 5905
    //     let actualValue = Day08.part2(input: input)
    //     XCTAssertEqual(actualValue, expectedValue, "Actual value should be equal to expected value")
    // }
}
