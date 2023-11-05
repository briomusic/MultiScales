import SwiftUI
import MusicTheory

enum FlatSharp: String, CaseIterable {
	case flat = "b"
	case sharp = "#"
}

struct ScaleEditorView: View {
	var viewModel: ScaleEditorViewModel
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
			Text("Scale Editor")
				.font(.title)
				.frame(maxWidth: .infinity, alignment: .center)
			Picker("FlatSharp", selection: $flatSharp) {
				ForEach(FlatSharp.allCases, id:\.self) { flatSharp in
					Text(flatSharp.rawValue)
				}
			}
			.pickerStyle(.segmented)
			
			Picker("Key", selection: viewModel.$scale.scale.key) {
					ForEach(availableKeys, id:\.description) { key in
						Text(key.description).tag(key)
					}
			}
			
			Picker("Type", selection: viewModel.$scale.scale.type) {
					ForEach(ScaleType.all, id:\.description) { scaleType in
						Text(scaleType.description).tag(scaleType)
					}
			}
			
			ColorPicker("Set the scale color", selection: viewModel.$scale.tintColor)
			
			Toggle("active", isOn: viewModel.$scale.isActive)
		}
		.listStyle(.insetGrouped)
    }
}

struct ScaleEditorView_Previews: PreviewProvider {
    static var previews: some View {
		ScaleEditorView(viewModel: ScaleEditorViewModel(scale: .constant(TintedScale.standard[0])))
    }
}
