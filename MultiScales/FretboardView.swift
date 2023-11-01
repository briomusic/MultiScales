//
//  FretboardView.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 01.11.23.
//

import SwiftUI

struct FretboardView: View {
    var body: some View {
		VStack {
			NumberedFretView()
			NumberedFretView()
			NumberedFretView()
			NumberedFretView()
			NumberedFretView()
			NumberedFretView()
		}
    }
}

struct FretboardView_Previews: PreviewProvider {
    static var previews: some View {
        FretboardView()
    }
}
