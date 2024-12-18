//
//  MultiScalesTests.swift
//  MultiScalesTests
//
//  Created by Brio Taliaferro on 01.11.23.
//

import XCTest
import SwiftUI
@testable import MultiScales
@testable import Fretboard
import MusicTheory

final class MultiScalesTests: XCTestCase {
	
	let fretProvider = FretProvider(fretRange: FretRange(lowestFret: 0, highestFret: 12))

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAPentatonicOnEAndAString() throws {
		let scale1 = Scale(type: .pentatonicMinor, key: Key(type: .a))
		let tintedScale = TintedScale(scale: scale1, tintColor: .red)
		print("keys:", scale1.keys)
		print("pitches:", scale1.pitches(octaves: [1,2,3,4]))
		
		let fretsOnEString = fretProvider.diatonicFrets(for: scale1, on: .e2)
		XCTAssertEqual(fretsOnEString, [0, 3, 5, 8, 10, 12])
		
		let fretsOnAString = fretProvider.diatonicFrets(for: scale1, on: .a2)
		XCTAssertEqual(fretsOnAString, [0, 3, 5, 7, 10, 12])
		
		let fretColors = fretProvider.fretColors(for: tintedScale, on: .e2)
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
	
	func testColorsForOneScale() throws {
		let tintedScale = TintedScale(scale: Scale(type: .pentatonicMinor, key: Key(type: .a)),
									  tintColor: .red)
		
		let colors = fretProvider.fretColors(for: tintedScale, on: .e2)
		let testColors: [Color] = [.clear, .clear, .red, .clear, .red, .clear, .clear, .red, .clear, .red, .clear, .red]
		XCTAssertEqual(colors, testColors)
	}
	
	func testColorsForTwoScales() throws {
		let tintedScale1 = TintedScale(scale: Scale(type: .pentatonicMinor, key: Key(type: .a)),
									   tintColor: .red)
		let tintedScale2 = TintedScale(scale: Scale(type: .pentatonicMinor, key: Key(type: .d)),
									   tintColor: .blue)
		
		let colors = fretProvider.fretColors(for: [tintedScale1, tintedScale2], on: .e2)
		let testColors: [FingeringColors] = [
			FingeringColors(colors: [.clear, .blue]),
			FingeringColors(colors: [.clear, .clear]),
			FingeringColors(colors: [.red, .blue]),
			FingeringColors(colors: [.clear, .clear]),
			FingeringColors(colors: [.red, .blue]),
			FingeringColors(colors: [.clear, .clear]),
			FingeringColors(colors: [.clear, .clear]),
			FingeringColors(colors: [.red, .blue]),
			FingeringColors(colors: [.clear, .clear]),
			FingeringColors(colors: [.red, .blue]),
			FingeringColors(colors: [.clear, .clear]),
			FingeringColors(colors: [.red, .clear])
		]
		XCTAssertEqual(colors, testColors)
	}

	func testFretboardForTwoScales() throws {
		let tintedScale1 = TintedScale(scale: Scale(type: .pentatonicMinor, key: Key(type: .a)),
									   tintColor: .red)
		let tintedScale2 = TintedScale(scale: Scale(type: .pentatonicMinor, key: Key(type: .d)),
									   tintColor: .blue)
		
		let fretboard = fretProvider.fretboardConfiguration(for: [tintedScale1, tintedScale2])
		let testFingerings: Dictionary<FretboardConfiguration.String, [FingeringColors]> = [
			.a2: [FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .clear]), FingeringColors(colors: [.clear, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue])],
			.e4: [FingeringColors(colors: [.clear, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .clear])],
			.g3: [FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .clear]), FingeringColors(colors: [.clear, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue])],
			.d3: [FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .clear]), FingeringColors(colors: [.clear, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue])],
			.b3: [FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .clear]), FingeringColors(colors: [.clear, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.clear, .clear])],
			.e2: [FingeringColors(colors: [.clear, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .blue]), FingeringColors(colors: [.clear, .clear]), FingeringColors(colors: [.red, .clear])]
		]
		
		XCTAssertEqual(fretboard.fingerings, testFingerings)
	}
	
	func testSemitones() throws {
		let e = Key(type: .e)
		let f = Key(type: .f)
		let g = Key(type: .g)
		let c = Key(type: .g)

		let expectedOne = e.semitones(to: f)
		let expectedTwo = f.semitones(to: g)
		let alsoTwo = g.semitones(to: f)
		
		XCTAssertEqual(expectedOne, 1)
		XCTAssertEqual(expectedTwo, 2)
		XCTAssertEqual(alsoTwo, 2)
	}
}
