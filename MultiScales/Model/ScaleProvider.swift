//
//  ScaleProvider.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 03.11.23.
//

import Foundation
import MusicTheory
import SwiftUI

class ScaleProvider: ObservableObject {
	@Published var scales = TintedScale.standard
}

struct TintedScale: Identifiable, Equatable {
	var scale: Scale
	var tintColor: Color
	var isActive: Bool
	let id = UUID()
	
	init(scale: Scale, tintColor: Color, active: Bool = true) {
		self.scale = scale
		self.tintColor = tintColor
		self.isActive = active
	}
	
	static var standard = [
		TintedScale(scale: Scale(type: .pentatonicMinor, key: Key(type: .e)),
								  tintColor: .purple),
		TintedScale(scale: Scale(type: .pentatonicMinor, key: Key(type: .a)),
								  tintColor: .orange),
		TintedScale(scale: Scale(type: .pentatonicMinor, key: Key(type: .d)),
								  tintColor: .blue)
		]
}
