import Foundation
import SwiftUI

class FretboardViewModel {
	let fretMarkers = FretMarker.standard
	let fretboard: Fretboard
	
	init(fretboard: Fretboard) {
		self.fretboard = fretboard
	}

	func stringViewModel(for string: Fretboard.String?) -> StringViewModel {
		var fretColors = [[Color]]()
		if let string,
		   let colors = fretboard.fingerings[string] {
			fretColors = colors
		}
		return StringViewModel(string: string, fretMarkers: fretMarkers, fretColors: fretColors)
	}
}
