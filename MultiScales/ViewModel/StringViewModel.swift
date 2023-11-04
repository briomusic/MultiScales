import Foundation
import SwiftUI

class StringViewModel {
	var string: Fretboard.String?
	var fretMarkers: [FretMarker]
	var fretColors = [[Color]]()
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

	init(string: Fretboard.String?, fretMarkers: [FretMarker], fretColors: [[Color]]) {
		self.string = string
		self.fretMarkers = fretMarkers
		self.fretColors = fretColors
	}
}
