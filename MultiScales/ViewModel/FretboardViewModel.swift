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
	let scale = Scale(type: .pentatonicMinor, key: Key(type: .e))
	
	func stringViewModel(for string: GuitarString?) -> StringViewModel {
		var fretColors = [Color]()
		if let string {
			fretColors = fretProvider.fretColors(for: scale, on: string)
		}
		return StringViewModel(string: string, fretMarkers: fretMarkers, fretColors: fretColors)
		/*
		var activeFrets = [Int]()
		if let string {
			activeFrets = fretProvider.diatonicFrets(for: scale, on: string)
		}
		return StringViewModel(string: string, fretMarkers: fretMarkers, activeFrets: activeFrets)
		 */
	}
}
