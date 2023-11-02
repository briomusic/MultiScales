//
//  Fret.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 02.11.23.
//

import Foundation
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
}

struct Fingering {	
	let fretRange: FretRange
	
	init(fretRange: FretRange = FretRange()) {
		self.fretRange = fretRange
	}
	
	func fret(for pitch: Pitch, on string: GuitarString) -> Int? {
		let pitchRange = PitchRange(fretRange: fretRange, string: string)
		guard pitch >= pitchRange.minPitch,
			  pitch <= pitchRange.maxPitch else { return nil }
		
		let interval = string.basePitch - pitch
		return interval.semitones
	}
}
