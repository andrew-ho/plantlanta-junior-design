import XCTest
@testable import PlantlantaApp

final class PlantlantaAppTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(PlantlantaApp().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
