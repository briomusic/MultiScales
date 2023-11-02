//
//  StringViewModel.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 02.11.23.
//

import Foundation

class StringViewModel {
	var string: GuitarString?
	var fretMarkers: [FretMarker]
	var activeFrets: [Int]
	var stringPosition: StringPosition {
		guard let string else {return .fretNumbers}
		switch string {
		case .e2:
			return .first
		case .a2, .d3, .g3, .b3:
			return .middle
		case .e4:
			return .last
		}		
	}

	init(string: GuitarString?, fretMarkers: [FretMarker], activeFrets: [Int]) {
		self.string = string
		self.fretMarkers = fretMarkers
		self.activeFrets = activeFrets
	}
}
