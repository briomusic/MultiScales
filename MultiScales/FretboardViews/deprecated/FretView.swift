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
			FretStringView(fretColors: [.primary], stringPosition: .first)
			FretStringView(fretColors: [.primary], stringPosition: .middle)
			FretStringView(fretColors: [.primary], stringPosition: .middle)
			FretStringView(fretColors: [.clear], stringPosition: .middle)
			FretStringView(fretColors: [.primary], stringPosition: .middle)
			FretStringView(fretColors: [.primary], stringPosition: .last)
		}
	}
}

struct FretView_Previews: PreviewProvider {
    static var previews: some View {
        FretView()
    }
}
