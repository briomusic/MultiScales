import SwiftUI
import Fretboard

struct HomeView: View {
	@StateObject var viewModel: HomeViewModel
	@State var isShowingPopup: Bool = false
		
	var body: some View {
		GeometryReader { geometry in
			HStack {
				Spacer()
				AStack(geometry: geometry) {
					ScaleButtonGrid(viewModel: viewModel, geometry: geometry)
					FretboardView(viewModel: viewModel.fretboardViewModel())
						.padding()
						.frame(maxWidth: 400)
				}
				Spacer()
			}
		}
		.frame(alignment: .center)
    }
}


struct ScaleButtonGrid: View {
	@ObservedObject var viewModel: HomeViewModel
	var geometry: GeometryProxy
	var body: some View {
		AStack(geometry: geometry, reverseGeometry: true) {
			ForEach($viewModel.scaleProvider.scales) { $scale in
				ScaleButtonView(scale: $scale, geometry: geometry)
			}
		}
	}
}

struct ScaleButtonView: View {
	@Binding var scale: TintedScale
	@State var isShowingPopup: Bool = false
	var geometry: GeometryProxy

	var body: some View {
		Button {
			isShowingPopup = true
		} label: {
			VStack {
				Text(scale.scale.key.description)
					.font(.title)
				Text(scale.scale.type.description)
					.font(.caption)
			}
			.foregroundColor(scale.isActive ? scale.tintColor : Color.secondary)
			.frame(width: 100)
		}
		.popover(isPresented: $isShowingPopup, content: {
			ScaleEditorView(viewModel: ScaleEditorViewModel(scale: $scale))
				.frame(minWidth: 300, minHeight: 350)
		})
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(scaleProvider: ScaleProvider()))
			.previewDevice(PreviewDevice(rawValue: "iPhone 14"))
			.previewDisplayName("iPhone 14")
		
		HomeView(viewModel: HomeViewModel(scaleProvider: ScaleProvider()))
			.previewDevice(PreviewDevice(rawValue: "iPad Air"))
			.previewDisplayName("iPad Air")
    }
}
