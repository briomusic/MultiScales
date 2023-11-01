//
//  SwiftUIView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

struct NumberedFretView: View {
	var fretNumber: Int
	var fretNumberString: String {
		if fretNumber == 0 {
			return ""
		} else {
			return "\(fretNumber)"
		}
	}
	
	init(fretNumber: Int = 0) {
		self.fretNumber = fretNumber
	}
	
    var body: some View {
		GeometryReader { proxy in
			HStack {
				Text(fretNumberString)
					.font(.system(size: proxy.size.width / 14, weight: .medium))
					.frame(width: proxy.size.width / 12)
				FretView()
//					.background(.red)
			}
		}
    }
}

struct NumberedFretView_Previews: PreviewProvider {
    static var previews: some View {
		NumberedFretView(fretNumber: 4)
    }
}
