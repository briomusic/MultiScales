//
//  FretboardViewModel.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 02.11.23.
//

import Foundation
import MusicTheory

class FretboardViewModel {
	let fretMarkers = FretMarker.standard
	let fretProvider = FretProvider()
	let scale = Scale(type: .pentatonicMinor, key: Key(type: .a))
	
	func stringViewModel(for string: GuitarString?) -> StringViewModel {
		StringViewModel(string: string, fretMarkers: fretMarkers, activeFrets: [])
	}
}
