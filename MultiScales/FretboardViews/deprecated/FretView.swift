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
			FretStringView(fretColor: .primary, stringPosition: .first)
			FretStringView(fretColor: .primary, stringPosition: .middle)
			FretStringView(fretColor: .primary, stringPosition: .middle)
			FretStringView(fretColor: .clear, stringPosition: .middle)
			FretStringView(fretColor: .primary, stringPosition: .middle)
			FretStringView(fretColor: .primary, stringPosition: .last)
		}
	}
}

struct FretView_Previews: PreviewProvider {
    static var previews: some View {
        FretView()
    }
}
