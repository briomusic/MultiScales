//
//  ContentView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

struct HomeView: View {
	@StateObject var viewModel: HomeViewModel
	@State var isShowingPopup: Bool = false

    var body: some View {
		VStack {
			HStack {
				ForEach($viewModel.scaleProvider.scales) { $scale in
					ScaleButtonView(scale: $scale)
				}
			}
			FretboardView(viewModel: FretboardViewModel(tintedScales: viewModel.scaleProvider.scales))
				.padding()
				.frame(maxWidth: 400)
		}
    }
}

struct ScaleButtonView: View {
	@Binding var scale: TintedScale
	@State var isShowingPopup: Bool = false
	var body: some View {
		Button {
			isShowingPopup = true
		} label: {
			VStack {
				Text(scale.scale.key.description)
					.font(.title)
				Text(scale.scale.type.description)
					.font(.caption)
			}
			.foregroundColor(scale.isActive ? scale.tintColor : Color.secondary)
			.frame(width: 100)
		}
		.popover(isPresented: $isShowingPopup, content: {
			ScaleEditorView(viewModel: ScaleEditorViewModel(scale: $scale))
		})
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(scaleProvider: ScaleProvider()))
			.previewDevice(PreviewDevice(rawValue: "iPhone 14"))
			.previewDisplayName("iPhone 14")
		
		HomeView(viewModel: HomeViewModel(scaleProvider: ScaleProvider()))
			.previewDevice(PreviewDevice(rawValue: "iPad Air"))
			.previewDisplayName("iPad Air")

    }
}
