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
	
	let fretProvider = FretProvider()

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
		let testColors: [[Color]] = [[.clear, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .clear]]
		XCTAssertEqual(colors, testColors)
	}
	
	func testFretboardForTwoScales() throws {
		let tintedScale1 = TintedScale(scale: Scale(type: .pentatonicMinor, key: Key(type: .a)),
									   tintColor: .red)
		let tintedScale2 = TintedScale(scale: Scale(type: .pentatonicMinor, key: Key(type: .d)),
									   tintColor: .blue)
		
		let fretboard = fretProvider.fretboardConfiguration(for: [tintedScale1, tintedScale2])
		let testFingerings: Dictionary<FretboardConfiguration.String, [[Color]]> = [
			.a2: [[.clear, .clear], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .clear], [.clear, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue]],
			.e4: [[.clear, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .clear]],
			.g3: [[.clear, .clear], [.red, .blue], [.clear, .clear], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .clear], [.clear, .blue], [.clear, .clear], [.red, .blue]],
			.d3: [[.clear, .clear], [.red, .clear], [.clear, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue]],
			.b3: [[.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .clear], [.clear, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.clear, .clear]],
			.e2: [[.clear, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .blue], [.clear, .clear], [.red, .clear]]
		]
		
		XCTAssertEqual(fretboard.fingerings, testFingerings)
	}
}
