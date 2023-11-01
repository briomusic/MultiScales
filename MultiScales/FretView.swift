//
//  FretView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

struct FretView: View {
	var body: some View {
		HStack {
			FretStringView(showFret: false, showFinger: true, stringPosition: .first)
			FretStringView(showFret: true, showFinger: true, stringPosition: .middle)
			FretStringView(showFret: true, showFinger: true, stringPosition: .middle)
			FretStringView(showFret: true, showFinger: false, stringPosition: .middle)
			FretStringView(showFret: true, showFinger: false, stringPosition: .middle)
			FretStringView(showFret: true, showFinger: true, stringPosition: .last)
		}
	}
}

struct FretView_Previews: PreviewProvider {
    static var previews: some View {
        FretView()
			.padding(40)
    }
}
