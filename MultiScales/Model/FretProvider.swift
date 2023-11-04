//
//  Fret.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 02.11.23.
//

import Foundation
import SwiftUI
import MusicTheory

enum GuitarString {
	case e2
	case a2
	case d3
	case g3
	case b3
	case e4
	
	var basePitch: Pitch {
		switch self {
		case .e2:
			return Pitch(key: Key(type: .e), octave: 2)
		case .a2:
			return Pitch(key: Key(type: .a), octave: 2)
		case .d3:
			return Pitch(key: Key(type: .d), octave: 3)
		case .g3:
			return Pitch(key: Key(type: .g), octave: 3)
		case .b3:
			return Pitch(key: Key(type: .b), octave: 3)
		case .e4:
			return Pitch(key: Key(type: .e), octave: 4)
		}
	}
}

struct FretRange {
	let lowestFret: Int
	let highestFret: Int
		
	init(lowestFret: Int = 0, highestFret: Int = 12) {
		self.lowestFret = lowestFret
		self.highestFret = highestFret
	}
}

struct PitchRange {
	let fretRange: FretRange
	let string: GuitarString

	var maxPitch: Pitch {
		string.basePitch + fretRange.highestFret
	}

	var minPitch: Pitch {
		string.basePitch + fretRange.lowestFret
	}
	
	func isInRange(pitch: Pitch) -> Bool {
		pitch >= minPitch && pitch <= maxPitch
	}
}

struct FretProvider {	
	let fretRange: FretRange
	
	init(fretRange: FretRange = FretRange()) {
		self.fretRange = fretRange
	}
	
	func fret(for pitch: Pitch, on string: GuitarString) -> Int? {
		let pitchRange = PitchRange(fretRange: fretRange, string: string)
		guard pitchRange.isInRange(pitch: pitch) else { return nil }
		
		let interval = string.basePitch - pitch
		return interval.semitones
	}
	
	func diatonicFrets(for scale: Scale, on string: GuitarString) -> [Int] {
		let pitchRange = PitchRange(fretRange: fretRange, string: string)
		let pitches = scale.pitches(octaves: [1,2,3,4])
		let reachablePitches = pitches.filter {
			pitchRange.isInRange(pitch: $0)
		}
		let reachableFrets = reachablePitches.compactMap { pitch in
			fret(for: pitch, on: string)
		}
		return reachableFrets
	}
	
	func fretColors(for tintedScale: TintedScale, on string: GuitarString) -> [Color] {
		let reachableFrets = diatonicFrets(for: tintedScale.scale, on: string)
		var colors = [Color]()
		for fretIndex in 1...fretRange.highestFret {
			if reachableFrets.contains(fretIndex) {
				colors.append(tintedScale.tintColor)
			} else {
				colors.append(Color.clear)
			}
		}
		return colors
	}
	
	func fretColors(for tintedScales: [TintedScale], on string: GuitarString) -> [[Color]] {
		let colorsByScale = tintedScales.map {
			self.fretColors(for: $0, on: string)
		}
		guard let count = colorsByScale.first?.count else {return [[]]}
		var nestedArray = [[Color]]()
		for index in 0..<count {
			var colorsForOneIndex = [Color]()
			for colorsForOneScale in colorsByScale {
				colorsForOneIndex.append(colorsForOneScale[index])
			}
			nestedArray.append(colorsForOneIndex)
		}
		return nestedArray
	}

}
