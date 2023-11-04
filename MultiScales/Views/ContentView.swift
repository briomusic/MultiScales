//
//  ContentView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

struct ContentView: View {
	@StateObject var scaleProvider = ScaleProvider()
	@State var isShowingPopup: Bool = false
	@State var selectedScale: TintedScale?

    var body: some View {
		VStack {
			HStack {
				ForEach(scaleProvider.scales) { scale in
					Button {
						isShowingPopup = true
						selectedScale = scale
					} label: {
						ScaleLabelView(scale: scale)
					}
				}
				Button {
					isShowingPopup = true
				} label: {
					Image(systemName: "plus")
						.resizable()
						.frame(width:25, height: 25)
				}
			}
			.popover(isPresented: $isShowingPopup, content: {
				Text("Popup")
			})
			FretboardView(viewModel: FretboardViewModel(tintedScales: scaleProvider.scales))
				.padding()
		}
    }
}

struct ScaleLabelView: View {
	let scale: TintedScale
	var body: some View {
		Text(scale.scale.shortDescription)
			.multilineTextAlignment(.center)
			.foregroundColor(scale.tintColor)
			.frame(width: 100)
	}
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
