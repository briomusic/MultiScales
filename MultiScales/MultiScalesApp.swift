//
//  MultiScalesApp.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI
import Combine

@main
struct MultiScalesApp: App {
	@StateObject var scaleProvider = ScaleProvider()

    var body: some Scene {
        WindowGroup {
			HomeView(viewModel: HomeViewModel(scaleProvider: scaleProvider))
        }
    }
}
