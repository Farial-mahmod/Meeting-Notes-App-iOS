//
//  Written by Farial Mahmod on 5/20/23.
//

import XCTest

final class TESTTests: XCTestCase {

  // to verify the number of notes initially available
    
    func testNotesTotal() {

        // taking an instance of the controller class
        
        let testNotesTotal = DataController()

        // as no note has been added initially, the number of notes equal to 0
        XCTAssertEqual(testNotesTotal.totalNotes.count, 0)
        
        
    }
}
