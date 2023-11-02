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
	
	let fretProvider = FretProvider()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAPentatonicOnEAndAString() throws {
		let scale1 = Scale(type: .pentatonicMinor, key: Key(type: .a))
		
		print("keys:", scale1.keys)
		print("pitches:", scale1.pitches(octaves: [1,2,3,4]))
		
		let fretsOnEString = fretProvider.diatonicFrets(for: scale1, on: .e2)
		XCTAssertEqual(fretsOnEString, [0, 3, 5, 8, 10, 12])
		
		let fretsOnAString = fretProvider.diatonicFrets(for: scale1, on: .a2)
		XCTAssertEqual(fretsOnAString, [0, 3, 5, 7, 10, 12])
		
		let fretColors = fretProvider.fretColors(for: scale1, on: .e2)
		print(fretColors)
    }
	
	func testFret() throws {
		var pitch = Pitch(key: Key(type: .f), octave: 2)
		XCTAssertEqual(fretProvider.fret(for: pitch, on: .e2), 1)

		pitch = Pitch(key: Key(type: .g), octave: 2)
		XCTAssertEqual(fretProvider.fret(for: pitch, on: .e2), 3)
		
		pitch = Pitch(key: Key(type: .d), octave: 2)
		let semitones = fretProvider.fret(for: pitch, on: .e2)
		XCTAssertNil(semitones)

		pitch = Pitch(key: Key(type: .f), octave: 3)
		XCTAssertNil(fretProvider.fret(for: pitch, on: .e2))
	}
		
	func testPitchRange() throws {
		let eStringFret0To12 = PitchRange(fretRange: FretRange(), string: .e2)
		
		print(eStringFret0To12.minPitch)
		print(eStringFret0To12.maxPitch)
				
		let aStringFret5To9 = PitchRange(fretRange: FretRange(lowestFret: 5, highestFret: 9), string: .a2)
		
		print(aStringFret5To9.minPitch)
		print(aStringFret5To9.maxPitch)
	}
	
}
