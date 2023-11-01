//
//  FretView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

struct FretView: View {
	var body: some View {
		HStack(spacing: 0) {
			FretStringView(showFinger: true, stringPosition: .first)
			FretStringView(showFinger: true, stringPosition: .middle)
			FretStringView(showFinger: true, stringPosition: .middle)
			FretStringView(showFinger: false, stringPosition: .middle)
			FretStringView(showFinger: false, stringPosition: .middle)
			FretStringView(showFinger: true, stringPosition: .last)
		}
	}
}

struct FretView_Previews: PreviewProvider {
    static var previews: some View {
        FretView()
    }
}
