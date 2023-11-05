//
//  ScaleEditorViewModel.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 03.11.23.
//

import Foundation
import SwiftUI

class ScaleEditorViewModel {
	@Binding var scale: TintedScale
	
	init(scale: Binding<TintedScale>) {
		self._scale = scale
	}
}
