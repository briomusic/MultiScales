//
//  FretboardViewModel.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 02.11.23.
//

import Foundation
import SwiftUI
import MusicTheory

class FretboardViewModel {
	let fretMarkers = FretMarker.standard
	let fretProvider = FretProvider()
	let tintedScales: [TintedScale]
	
	init(tintedScales: [TintedScale]) {
		self.tintedScales = tintedScales
	}

	func stringViewModel(for string: GuitarString?) -> StringViewModel {
		var fretColors = [[Color]]()
		if let string {
			fretColors = fretProvider.fretColors(for: tintedScales, on: string)
		}
		return StringViewModel(string: string, fretMarkers: fretMarkers, fretColors: fretColors)
	}
}
