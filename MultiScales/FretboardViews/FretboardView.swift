//
//  FretboardView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI


struct FretboardView: View {
	let viewModel = FretboardViewModel()
    var body: some View {
		GeometryReader { proxy in
//			byFrets
			byStrings
		}
    }
	
	var byStrings: some View {
		HStack(spacing: 0) {
			StringView(viewModel: viewModel.stringViewModel(for: nil))
				.frame(width: 30)
			StringView(viewModel: viewModel.stringViewModel(for: .e2))
			StringView(viewModel: viewModel.stringViewModel(for: .a2))
			StringView(viewModel: viewModel.stringViewModel(for: .d3))
			StringView(viewModel: viewModel.stringViewModel(for: .g3))
			StringView(viewModel: viewModel.stringViewModel(for: .b3))
			StringView(viewModel: viewModel.stringViewModel(for: .e4))
		}
	}
	
	// deprecated
	var byFrets: some View {
		VStack(spacing: 0) {
			SaddleView()
				.frame(height: 5)
			VStack(spacing: 0) {
				ForEach(viewModel.fretMarkers, content: { fret in
					NumberedFretView(fretNumber: fret.number)
				})
			}
		}
	}
}

struct SaddleView: View {
	var body: some View {
		GeometryReader { proxy in
			Color.primary
				.frame(width: proxy.size.width / 1.4,
					   height: 5)
				.offset(CGSize(width: proxy.size.width / 4.5, height: 0))
		}
	}
}

struct FretboardView_Previews: PreviewProvider {
    static var previews: some View {
        FretboardView()
    }
}
