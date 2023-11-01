//
//  StringView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

struct StringView: View {
	var stringPosition: StringPosition
	var frets: [Fret]

    var body: some View {
		GeometryReader { proxy in
			VStack(spacing: 0) {
				ForEach(frets) { fret in
					switch stringPosition {
					case .fretNumbers:
						FretNumberView(fretNumber: fret.number)
							.frame(height: proxy.size.height / CGFloat(frets.count))
					default:
						FretStringView(showFinger: true, stringPosition: stringPosition)
					}
				}
			}
		}
    }
}


struct StringView_Previews: PreviewProvider {
    static var previews: some View {
		StringView(stringPosition: .middle, frets: Fret.frets)
		StringView(stringPosition: .fretNumbers, frets: Fret.frets)
    }
}
