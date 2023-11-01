//
//  FretboardView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

struct FretboardView: View {
	var fretNumbers = [0,0,3,0,5,0,7,0,9,0,0,12]//,0,0,15,0,17]
    var body: some View {
		GeometryReader { proxy in
			VStack {
				SaddleView()
					.frame(height: 5)
				VStack {
					ForEach(fretNumbers, id: \.self) { fretNumber in
						NumberedFretView(fretNumber: fretNumber)
					}
				}
			}
		}
    }
}

struct SaddleView: View {
	var body: some View {
		GeometryReader { proxy in
			HStack {
				Color.clear
					.frame(width: proxy.size.width / 17)
				Color.primary
					.frame(width: proxy.size.width / 1.27,
						   height: 5)
					.offset(CGSize(width: proxy.size.width / 16, height: 0))
			}
		}
	}
}

struct FretboardView_Previews: PreviewProvider {
    static var previews: some View {
        FretboardView()
    }
}
