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
	
	let fingering = Fingering()

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
	
	func testFret() throws {
		var pitch = Pitch(key: Key(type: .f), octave: 2)
		XCTAssertEqual(fingering.fret(for: pitch, on: .e2), 1)

		pitch = Pitch(key: Key(type: .g), octave: 2)
		XCTAssertEqual(fingering.fret(for: pitch, on: .e2), 3)
		
		pitch = Pitch(key: Key(type: .d), octave: 2)
		let semitones = fingering.fret(for: pitch, on: .e2)
		XCTAssertNil(semitones)

		pitch = Pitch(key: Key(type: .f), octave: 3)
		XCTAssertNil(fingering.fret(for: pitch, on: .e2))
	}
		
	func testPitchRange() throws {
		var eStringFret0To12 = PitchRange(fretRange: FretRange(), string: .e2)
		
		print(eStringFret0To12.minPitch)
		print(eStringFret0To12.maxPitch)
		
		var aStringFret5To9 = PitchRange(fretRange: FretRange(lowestFret: 5, highestFret: 9), string: .a2)
		
		print(aStringFret5To9.minPitch)
		print(aStringFret5To9.maxPitch)
	}
	
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
