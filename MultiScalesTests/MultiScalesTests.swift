//
//  MultiScalesTests.swift
//  MultiScalesTests
//
//  Created by Brio Taliaferro on 01.11.23.
//

import XCTest
@testable import MultiScales
import MusicTheory

final class MultiScalesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
		let scale1 = Scale(type: .pentatonicMinor, key: Key(type: .a))
		
		print("keys:", scale1.keys)
		print("pitches:", scale1.pitches(octaves: [1,2,3]))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
