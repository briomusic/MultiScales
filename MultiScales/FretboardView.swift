//
//  FretboardView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

struct FretboardView: View {
	var frets = Fret.frets
    var body: some View {
		GeometryReader { proxy in
//			byFrets
			byStrings
		}
    }
	
	var byFrets: some View {
		VStack(spacing: 0) {
			SaddleView()
				.frame(height: 5)
			VStack(spacing: 0) {
				ForEach(frets, content: { fret in
					NumberedFretView(fretNumber: fret.number)
				})
			}
		}
	}
	
	var byStrings: some View {
		HStack(spacing: 0) {
			StringView(stringPosition: .fretNumbers, frets: frets)
			HStack(spacing: 0) {
				StringView(stringPosition: .first, frets: frets)
				StringView(stringPosition: .middle, frets: frets)
				StringView(stringPosition: .middle, frets: frets)
				StringView(stringPosition: .middle, frets: frets)
				StringView(stringPosition: .middle, frets: frets)
				StringView(stringPosition: .last, frets: frets)
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
