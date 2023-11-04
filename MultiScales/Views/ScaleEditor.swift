//
//  ScaleEditor.swift
//  MultiScales
//
//  Created by Brio Taliaferro on 03.11.23.
//

import SwiftUI
import MusicTheory

enum FlatSharp: String, CaseIterable {
	case flat = "b"
	case sharp = "#"
}

struct ScaleEditor: View {
	@State private var scaleType: ScaleType = .pentatonicMinor
	@State private var key: Key = Key(type: .a)
	@State private var flatSharp: FlatSharp = .flat
	var availableKeys: [Key] {
		switch flatSharp {
		case .flat:
			return Key.keysWithFlats
		case .sharp:
			return Key.keysWithSharps
		}
	}
	
    var body: some View {
		List {
			Picker("FlatSharp", selection: $flatSharp) {
				ForEach(FlatSharp.allCases, id:\.self) { flatSharp in
					Text(flatSharp.rawValue)
				}
			}
			.pickerStyle(.segmented)
			Picker("Key", selection: $key) {
				Text("").tag("")
					ForEach(availableKeys, id:\.description) { key in
						Text(key.description).tag(key)
					}
			}
			Picker("Type", selection: $scaleType) {
					ForEach(ScaleType.all, id:\.description) { scaleType in
						Text(scaleType.description).tag(scaleType)
					}
			}
		}
		.listStyle(.insetGrouped)
    }
}

struct ScaleEditor_Previews: PreviewProvider {
    static var previews: some View {
		ScaleEditor()
    }
}
