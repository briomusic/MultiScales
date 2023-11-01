//
//  SwiftUIView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

struct NumberedFretView: View {
    var body: some View {
		GeometryReader { proxy in
			HStack {
				Text("5")
					.font(.system(size: proxy.size.width / 10, weight: .medium))
				FretView()
//					.background(.red)
			}
		}
    }
}

struct NumberedFretView_Previews: PreviewProvider {
    static var previews: some View {
		NumberedFretView()
    }
}
