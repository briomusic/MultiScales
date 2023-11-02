//
//  StringView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

struct StringView: View {
	let viewModel: StringViewModel
	
    var body: some View {
		GeometryReader { proxy in
			VStack(spacing: 0) {
				if case .fretNumbers = viewModel.stringPosition {
					EmptyView()
				} else {
					FretLineView(stringPosition: viewModel.stringPosition, proxy: proxy)
				}

				VStack(spacing: 0) {
					//				FretLineView(stringPosition: stringPosition, proxy: proxy)
					ForEach(viewModel.fretMarkers) { fretMarker in
						switch viewModel.stringPosition {
						case .fretNumbers:
							FretNumberView(fretNumber: fretMarker.number)
								.frame(height: proxy.size.height / CGFloat(viewModel.fretMarkers.count))
						default:
							FretStringView(showFinger: true, stringPosition: viewModel.stringPosition)
						}
					}
				}
			}
		}
    }
}


struct StringView_Previews: PreviewProvider {
    static var previews: some View {
		StringView(viewModel: StringViewModel(string: .d3, fretMarkers: FretMarker.standard, activeFrets: []))
		StringView(viewModel: StringViewModel(string: nil, fretMarkers: FretMarker.standard, activeFrets: []))
    }
}
