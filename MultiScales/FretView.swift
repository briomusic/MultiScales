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
			FretStringView(showFret: false, showFinger: true)
			FretStringView(showFret: true, showFinger: true)
			FretStringView(showFret: true, showFinger: true)
			FretStringView(showFret: true, showFinger: false)
			FretStringView(showFret: true, showFinger: false)
			FretStringView(showFret: true, showFinger: true)
		}
	}
}

struct FretView_Previews: PreviewProvider {
    static var previews: some View {
        FretView()
			.padding(40)
    }
}
