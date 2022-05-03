

import XCTest
@testable import TechChallenge

class TechChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSumOfTransactionForFilteredCategory() throws {
        
        let testData = ModelData.sampleTransactions
        let entertainmentCtegory =  HelperFunctions.calculateTotalAmountSpentInCategory(category: "entertainment", transactions: testData)
        XCTAssertNotNil(entertainmentCtegory)
        XCTAssertEqual(entertainmentCtegory, "82.99")
        
        let foodCategory =  HelperFunctions.calculateTotalAmountSpentInCategory(category: "food", transactions: testData)
        XCTAssertNotNil(foodCategory)
        XCTAssertEqual(foodCategory,"74.28")
    }
    
    func testFilteringOfTransactionsAccordingToCategory(){
        let testData = ModelData.sampleTransactions
        
       let filteredCategory =  HelperFunctions.filterTransactionsAccordingToCategory(categoryName: "food", transactions: testData)
        for item in filteredCategory {
            XCTAssertEqual(item.category.rawValue,"food")
        }
    }
}
