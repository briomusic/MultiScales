//
//  HomeViewModel.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 03.11.23.
//

import Foundation
import SwiftUI
import Fretboard

class HomeViewModel: ObservableObject {
	@Published var scaleProvider: ScaleProvider

	internal init(scaleProvider: ScaleProvider) {
		self.scaleProvider = scaleProvider
	}
	
	func fretboardViewModel() -> FretboardViewModel {
		let fretProvider = FretProvider()
		let fretboardConfiguration = fretProvider.fretboardConfiguration(for: scaleProvider.scales)
		return FretboardViewModel(fretboard: fretboardConfiguration)
	}
}
