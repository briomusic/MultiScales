//
//  Scale+Description.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 24.11.24.
//
import MusicTheory

extension Scale {
	var scaleDescription: String {
		var string = ""
		var lastKey: Key?
		var firstKey: Key?
		
		for key in self.keys {
			if firstKey == nil {
				firstKey = key
			}
			string.append(key.scaleDescriptionSegment(lastKey: lastKey))
			lastKey = key
		}
		
		if let firstKey = firstKey {
			string.append(firstKey.scaleDescriptionSegment(lastKey: lastKey))
		}
		
		return string
	}
}

extension Key {
	public func scaleDescriptionSegment(lastKey: Key?) -> String {
		var string = ""
		if let lastKey {
			var interval = self.semitones(to: lastKey)
			if interval > 3 {
				interval = 12-interval
			}
			string.append(String(repeating: "-", count: interval - 1))
		}
		string.append(self.description)
		return string
	}
	
	public func semitones(to rhs: Key) -> Int {
		let lhsMod = (self.type.rawValue + self.accidental.rawValue) % 12
		let normalizedLhs = lhsMod < 0 ? (12 + lhsMod) : lhsMod
		
		let rhsMod = (rhs.type.rawValue + rhs.accidental.rawValue) % 12
		let normalizedRhs = rhsMod < 0 ? (12 + rhsMod) : rhsMod
		
		return abs(normalizedLhs - normalizedRhs)
	}
}
