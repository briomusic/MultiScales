//
//  FretboardView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

struct FretboardView: View {
    var body: some View {
		GeometryReader { proxy in
			VStack {
				SaddleView()
					.frame(height: 5)
				VStack {
					NumberedFretView()
					NumberedFretView()
					NumberedFretView(fretNumber: 3)
					NumberedFretView()
					NumberedFretView(fretNumber: 5)
					NumberedFretView()
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
