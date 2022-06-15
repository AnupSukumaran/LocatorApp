//
//  LocatorAppTests.swift
//  LocatorAppTests
//
//  Created by Sukumar Anup Sukumaran on 15/06/2022.
//

import XCTest
@testable import LocatorApp

class LocatorAppTests: XCTestCase {

    var sut: HomeViewModel!
    override func setUpWithError() throws {
        sut = HomeViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testLatLongVals() throws {
        let valtuts = sut.checkLatLongVals(latStr: "51.478558225295565", longStr: "-3.1767163043570044")
        XCTAssertEqual(valtuts.state, true)

    }


}
