//
//  ScaleProvider.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 03.11.23.
//

import Foundation
import MusicTheory
import SwiftUI

struct TintedScale: Identifiable {
	let scale: Scale
	let tintColor: Color
	let id = UUID()
	
	static let standard = [
		TintedScale(scale: Scale(type: .pentatonicMinor, key: Key(type: .e)),
								  tintColor: .purple),
		TintedScale(scale: Scale(type: .pentatonicMinor, key: Key(type: .a)),
								  tintColor: .orange),
		TintedScale(scale: Scale(type: .pentatonicMinor, key: Key(type: .d)),
								  tintColor: .blue)
		]
}

extension Scale {
	var shortDescription: String {
"""
  \(key)
  \(type)
"""
	}
	
	/*
	 \(key)
	 \(type)
	 */
}

class ScaleProvider: ObservableObject {
	@Published var scales = TintedScale.standard
}
