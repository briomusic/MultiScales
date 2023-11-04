//
//  HomeViewModel.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 03.11.23.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
	@ObservedObject var scaleProvider = ScaleProvider()

	internal init(scaleProvider: ScaleProvider) {
		self.scaleProvider = scaleProvider
	}
}
