//
//  StringView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

struct StringView: View {
	var stringPosition: StringPosition
	var fretMarkers: [FretMarker]

    var body: some View {
		GeometryReader { proxy in
			VStack(spacing: 0) {
				if case .fretNumbers = stringPosition {
					EmptyView()
				} else {
					FretLineView(stringPosition: stringPosition, proxy: proxy)
				}

				VStack(spacing: 0) {
					//				FretLineView(stringPosition: stringPosition, proxy: proxy)
					ForEach(fretMarkers) { fretMarker in
						switch stringPosition {
						case .fretNumbers:
							FretNumberView(fretNumber: fretMarker.number)
								.frame(height: proxy.size.height / CGFloat(fretMarkers.count))
						default:
							FretStringView(showFinger: true, stringPosition: stringPosition)
						}
					}
				}
			}
		}
    }
}


struct StringView_Previews: PreviewProvider {
    static var previews: some View {
		StringView(stringPosition: .middle, fretMarkers: FretMarker.standard)
		StringView(stringPosition: .fretNumbers, fretMarkers: FretMarker.standard)
    }
}
