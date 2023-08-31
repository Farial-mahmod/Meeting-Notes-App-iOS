import XCTest

final class MeetingNotesUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {

        app.launch()
        
        continueAfterFailure = false

    }
    
    
    // testing the existance of the title text
    func testTitle(){
        XCTAssert(app.navigationBars["Meeting Notes"].exists)
    }
    
    // testing by tapping the Add Notes button
    func tapAddButton(){
        let addButton = app.buttons["Add Notes"]
        XCTAssertTrue(addButton.exists)
        addButton.tap()
    }
    
    // testing by tapping the Edit button
    func tapEditButton(){
        var editButton = app.buttons["Edit"]
        XCTAssertTrue(editButton.exists)
        editButton.tap()
    }

    // terminating the app when tests are completed
    override func tearDownWithError() throws {
        app.terminate()
    }

    func testExample() throws {
        XCTAssertTrue(app.staticTexts["Meeting Notes"].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
